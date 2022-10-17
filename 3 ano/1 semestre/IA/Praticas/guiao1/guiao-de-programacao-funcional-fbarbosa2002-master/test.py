
def concat(l1, l2):
	if l2 == []:
		return 0
	
	l1.append(l2[0])
	concat(l1,l2[1:])

	return l1


def fusao_ordenada(lista1, lista2):

	if lista2 == [] :
		return 0
	
	lista1.append(lista2[0])
	concat(lista1,lista2[1:])

	return lista1.sort() + fusao_ordenada(lista1,lista2)
print(fusao_ordenada([1,2,3,4],[5,4,3,2,1]))