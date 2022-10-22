
# Module: tree_search
# 
# This module provides a set o classes for automated
# problem solving through tree search:
#    SearchDomain  - problem domains
#    SearchProblem - concrete problems to be solved
#    SearchNode    - search tree nodes
#    SearchTree    - search tree with the necessary methods for searhing
#
#  (c) Luis Seabra Lopes
#  Introducao a Inteligencia Artificial, 2012-2019,
#  Inteligência Artificial, 2014-2019
import math
from abc import ABC, abstractmethod
from argparse import Action
from inspect import CO_ASYNC_GENERATOR

# Dominios de pesquisa
# Permitem calcular
# as accoes possiveis em cada estado, etc
class SearchDomain(ABC):

    # construtor
    @abstractmethod
    def __init__(self,connections,coordinates):
        self.connections = connections
        self.coordinates = coordinates
    # lista de accoes possiveis num estado
    @abstractmethod
    def actions(self, state):
        lista = []

        for (C1,C2,D) in self.connections:
            
            if (C1 == state):
                lista += [(C1,C2)]
            elif (C2 == state):
                lista += [(C2,C1)]

        return lista

    # resultado de uma accao num estado, ou seja, o estado seguinte
    @abstractmethod
    def result(self, state, action):
        (C1,C2) = action

        if C1 == state:
            return C2

      
    # custo de uma accao num estado
    @abstractmethod
    def cost(self, state, action):
        a1,a2= action
        assert state == a1

        for(c1,c2,d) in self.connections:
            if(c1,c2) == action or (c2,c1)== action:
                return d
       

    # custo estimado de chegar de um estado a outro
    @abstractmethod
    def heuristic(self, state, goal):
        c1_x,c1_y = self.coordinates[state]
        c2_x , c2_y = self.coordinates[goal]

        return math.hypot(c1_x - c2_x , c1_y - c2_y)
        
      

    # test if the given "goal" is satisfied in "state"
    @abstractmethod
    def satisfies(self, state, goal):
        pass
        


# Problemas concretos a resolver
# dentro de um determinado dominio
class SearchProblem:
    def __init__(self, domain, initial, goal):
        self.domain = domain
        self.initial = initial
        self.goal = goal
    def goal_test(self, state):
        return self.domain.satisfies(state,self.goal)



# Nos de uma arvore de pesquisa
class SearchNode:
    def __init__(self,state,parent,depth,cost,heuristic): 
        self.state = state
        self.parent = parent
        self.depth = depth
        self.cost = cost
        self.heuristic = heuristic
    def __str__(self):
        return "no(" + str(self.state) + "," + str(self.parent) + ")"
    def __repr__(self):
        return str(self)

    def in_parent(self,newstate):
        if self.parent == None:
            return False

        if self.parent.state == newstate:
            return True 


        return self.parent.in_parent(newstate)
# Arvores de pesquisa
class SearchTree:

    # construtor
    def __init__(self,problem, strategy='breadth'): 
        self.problem = problem
        root = SearchNode(problem.initial, None, 0,0,problem.domain.heuristic(problem.initial,problem.goal))
        self.open_nodes = [root]
        self.strategy = strategy
        self.solution = None
        self.terminals = 0
        self.non_terminals = 0
        self.avg_branching = 0
       
        self.highest_cost_nodes = 0
        self.average_depth = 0
    @property
    def length(self):
        return self.solution.depth

    # obter o caminho (sequencia de estados) da raiz ate um no
    def get_path(self,node):
        if node.parent == None:
            return [node.state]
        path = self.get_path(node.parent)
        path += [node.state]
        return(path)

    # procurar a solucao
    def search(self, limit = None ):
        while self.open_nodes != []:
            node = self.open_nodes.pop(0)
            self.non_terminals += 1

            if self.problem.goal_test(node.state):
                self.terminals = len(self.open_nodes) + 1 
                self.solution = node
                self.non_terminals -= 1
                self.avg_branching = (self.terminals + self.non_terminals - 1) / self.non_terminals
                return self.get_path(node)
            lnewnodes = []
            for a in self.problem.domain.actions(node.state):
                newstate = self.problem.domain.result(node.state,a)
                
                if newstate not in self.get_path(node):
                    newnode = SearchNode(newstate,node, node.depth + 1,node.cost + self.problem.domain.cost(node.state,a),self.problem.domain.heuristic(newstate,self.problem.goal))
                    if limit == None or newnode.depth <= limit:
                        lnewnodes.append(newnode)

                              
            self.add_to_open(lnewnodes)

        return None
    

    # juntar novos nos a lista de nos abertos de acordo com a estrategia
    def add_to_open(self,lnewnodes):
        if self.strategy == 'breadth':
            self.open_nodes.extend(lnewnodes)
        elif self.strategy == 'depth':
            self.open_nodes[:0] = lnewnodes
        elif self.strategy == 'uniform':
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key = lambda node: node.cost)
        elif self.strategy == 'greedy':
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key = lambda node: node.heuristic)
        elif self.strategy == 'a*':
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key = lambda node: node.heuristic + node.cost)
        
        


    @property
    def cost(self):
        return self.solution.cost