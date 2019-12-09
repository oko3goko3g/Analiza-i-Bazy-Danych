# -*- coding: utf-8 -*-
"""
Created on Wed Oct  9 10:51:28 2019

@author: student148
"""

from math import sqrt, pi, sin #importuję pierwiastek kwadratowy i stałą pi
import numpy
import matplotlib.pyplot as plt

k=1240*sqrt(7)  #mnożenie i pierwiastkowanie
m=4467
l=2j
d=k+m
c=d+l
print(d)
print('{:.3f}'.format(d))   #trzy miejsca po przecinku
print('{:.20f}'.format(d))  #dwadziecia miejsc po przecinku
r=17
h=33
P=2*pi*r*h    #pole walca

x1=pi
t=45
r=2
B=((x1+r)/(r*sin(2*x1)+3.3456))*x1**(t*r)
print(B)

a=sqrt(2)
M=numpy.array([(a, 1, -a), (0, 1, 1), (-a, a, 1)])
A=numpy.linalg.inv(M)   #tworzenie tablic
C=numpy.linalg.det(M)   #wyznacznik macierzy 
D=numpy.transpose(M)    #transpozycja macierzy

print(M[0,0], M[2,2], M[2,1])
w1=M[:,2]
w2=M[1,:]

p=[1, -7, 3, 43, -28, -60]
z=numpy.roots(p)    #wyliczam pierwiastki

v1=numpy.linspace(1, 2, 3)
v2=numpy.arange(3, 10, 6)

def funct(x: float) -> float:   #robię funkcję
    return x**3 -3*x

x=numpy.linspace(-1,1)
y=[funct(i) for i in x]
plt.plot(x, y)
plt.show()

x2=numpy.linspace(-5,5)
y2=[funct(i) for i in x2]
plt.plot(x2, y2)
plt.show()

x3=numpy.linspace(0,5)
y3=[funct(i) for i in x3]
plt.plot(x3, y3)
plt.show()

m1=2.5
m2=3
v1=50/3
Q1_J=(m1*(v1**2))/2
Q1_cal=Q1_J/4,1855

Q2=(m2*(v1**2))/2
x4=numpy.linspace(0,2000/36)
plt.semilogy(x4, Q2)

