lista=[1,2,3,4,5,6,7,8,9,8,7,8,7,8,7,8,7]

for index, value in enumerate(lista):
    if value == 8:
      lista[index] = 7

print(lista)