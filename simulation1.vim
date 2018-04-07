#simulation1.vim

import numpy as np
import matplotlib.pyplot as plt
import random


TIMELIMIT = 100
N = 1000
SEED = 65535
R1 = 100
R2 = 1




class Boids:
    def __init__(self,cat):
        self.category = cat
        self.x = (random.random() - 0.5)*100
        self.y = (random.random() - 0.5)*100
        self.dx = (random.random() - 0.5)
        self.dy = (random.random() - 0.5)



    def calcnext(self):
        if self.category == 0:
            self.cohesion()
            self.separation()
            self.alignment()
            self.cat0()

        else:
            print("error no category")


    def cat0(self):
        self.x += self.dx
        self.y += self.dy
        self.dx += (random.random() - 0.5)
        self.dy += (random.random() - 0.5)


    def cohesion(self):
        avrx = 0
        avry = 0
        for i in range(len(a)):
            sx = self.x
            sy = self.y
            ax = a[i].x
            ay = a[i].y
            sdx = self.dx
            sdy = self.dy
            adx = a[i].dx
            ady = a[i].dy

            if ((sx-ax)**2+(sy-ay)**2)>R1:
                avrx += ax
                avry += ay
        avrx /= len(a)
        avry /= len(a)
        dist = (avrx - self.x)/10
        disty = (avry - self.y)/10
        self.dx += dist
        self.dy += disty







    def separation(self):
        avrx = 0
        avry = 0
        for i in range(len(a)):
            sx = self.x
            sy = self.y
            ax = a[i].x
            ay = a[i].y
            sdx = self.dx
            sdy = self.dy
            adx = a[i].dx
            ady = a[i].dy

            if ((sx-ax)**2+(sy-ay)**2)<R2:
                avrx += ax 
                avry += ay
        avrx /= len(a)
        avry /= len(a)
        dist = (avrx - self.x)/10
        disty = (avry - self.y)/10
        self.dx -= dist
        self.dy -= disty




    def alignment(self):
        avrx = 0
        avry = 0
        for i in range(len(a)):
            sx = self.x
            sy = self.y
            ax = a[i].x
            ay = a[i].y
            sdx = self.dx
            sdy = self.dy
            adx = a[i].dx
            ady = a[i].dy

            if R2<((sx-ax)**2+(sy-ay)**2)<R1:
                avrx += adx 
                avry += ady
        avrx /= len(a)
        avry /= len(a)
        self.dx += avrx/10
        self.dy += avry/10
 


    def putstate(self):
        print(self.x, self.y)


	              
		
def calcn(a):


    for i in range(len(a)):
        a[i].calcnext()
        xlist.append(a[i].x)
        ylist.append(a[i].y)




a =[Boids(0) for i in range(N)]

xlist = []
ylist = []

for t in range(TIMELIMIT):
    calcn(a)
    plt.clf()
    plt.axis([-1000, 1000, -1000, 1000])
    plt.plot(xlist, ylist, ".")
    plt.pause(0.001)
    xlist.clear()
    ylist.clear()
plt.pause(0.1)
