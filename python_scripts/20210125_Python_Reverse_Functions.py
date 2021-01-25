# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
# Exercise 1
x = 5

y = "Python exercises"

z = True

print (x, y, z)

# Exercise 2
x = 1
below_11 = True
while below_11:
    print (x)
    x = x + 1
    if x == 11:
        below_11 = False
    
    else:
        continue
      
# Exercise 3
start, end = -10, 0
for x in range (start, end):
    if x < 0:
        print (x, end = " ")

# Exercise 3
for i in range (-10,0):
    print (i)
    
# Exercise 4
n = int (input ('Enter a number : '))
add = 0
for n in range (0, n+1, 1):
    add = add + n
print ("Sum of first", n, "numbers is:", add)