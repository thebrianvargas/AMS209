"""



"""

#import necessary Python modules
import os
import numpy as np
#import matplotlib as mpl
#mpl.use('Agg')
#import matplotlib.pyplot as plt

#NOTE: my machine couldn't display plot diresctly so I used agg and then ,show() after saving

def make_make():
   """
   Function that interacts with the makefile by compiling and cleaning
      through OS system manipulation
   """
   #change working directory to the one with the Fortran files
   os.chdir("../LinAlg/")
   #if we don't have an executable, compile
   if "linear_solve.exe" not in os.listdir(os.curdir):
      os.system("make")
   #if we do have an executable, clean then compile
   else:
      os.system("make clean")
      os.system("make")

def save_data(A,b,num):
   """
   Function that saves the inputted data onto dat files for Fortran use later
   """
   rows = ''
   for row in A:
      for entry in row:
         rows += str(float(entry))+" "
      rows += '\n'
   f_A = open("A_"+str(num)+".dat", "w")
   f_A.write(rows)
   f_A.close()

   rows = ''
   for entry in b:
      rows += str(float(entry))+'\n'
   f_b = open("b_"+str(num)+".dat", "w")
   f_b.write(rows)
   f_b.close()   

def create_data():
   """
   Function that creates the data we will be using for the final project
   - manually inputted. Can be replaced with other function that gathers
     the necessary data for this code to work if to be used in general
   """
   #Will manually type was integers for now, will print as float strings
   A1 = [[1,1,-1],[1,2,-2],[-2,1,1]]
   b1 = [1,0,1]
   save_data(A1,b1,1)

   A2 = [[4,3,2,1],[3,4,3,2],[2,3,4,3],[1,2,3,4]]
   b2 = [1,1,-1,-1]
   save_data(A2,b2,2)

   A3 = [[1,-1,1,-1],[-1,3,-3,3],[2,-4,7,-7],[-3,7,-10,14]]
   b3 = [0,2,-2,-8]
   save_data(A3,b3,3)

def run_linearSolve():
   """
   Executes the Fortran executable linear_solve.exe
   """
   os.system("./linear_solve.exe")

if __name__ == "__main__":
   make_make()
   create_data()
   run_linearSolve()
