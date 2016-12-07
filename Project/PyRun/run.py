"""



"""

#import necessary Python modules
import os
import numpy as np
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt

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
#   f_A = open("A_"+str(num)+".dat", "w")
   f_A = open("A_1.dat", "w")
   f_A.write(rows)
   f_A.close()

   rows = ''
   for entry in b:
      rows += str(float(entry))+'\n'
#   f_b = open("b_"+str(num)+".dat", "w")
   f_b = open("b_1.dat", "w")
   f_b.write(rows)
   f_b.close()   

def create_data(num):
   """
   Function that creates the data we will be using for the final project
   - manually inputted. Can be replaced with other function that gathers
     the necessary data for this code to work if to be used in general
   """
   #Will manually type was integers for now, will print as float strings
   if num==1:
      A = [[1,1,-1],[1,2,-2],[-2,1,1]]
      b = [1,0,1]
   elif num==2:
      A = [[4,3,2,1],[3,4,3,2],[2,3,4,3],[1,2,3,4]]
      b = [1,1,-1,-1]
   elif num==3:
      A = [[1,-1,1,-1],[-1,3,-3,3],[2,-4,7,-7],[-3,7,-10,14]]
      b = [0,2,-2,-8]

   #convert to floats
   for i in range(len(A)):
      for j in range(len(A)):
         A[i][j] = float(A[i][j])
      b[i] = float(b[i])

   out = {"A":A, "b":b}
   return out

def run_linearSolve():
   """
   Executes the Fortran executable linear_solve.exe
   """
   os.system("./linear_solve.exe")

def python_solve(A,b):
   """
   Solves Ax=b using NumPy to compare with Fortran solutions as nx1 matrix
   """
   x = np.linalg.solve(A,b)
   x = np.mat(x).T
   return x

def solution_check(x,solFile,threshold=10**-6):
   """
   Checks the Fortran solution file against the Python solution
   """
   #obtain solution from fortran file to compare to
   fortran_x = np.zeros((len(b),1))
   f_x = open(solFile, "r")
   i = 0
   for entry in f_x:
      fortran_x[i] = entry
      i += 1
   f_x.close()
#   print fortran_x

   #compute error between python and fortran solutions
   error = np.linalg.norm(x-fortran_x)
   if error > threshold:
      print "Error too large in file: "+solFile
      print "Fortran x = "
      print fortran_x
      print "Python x = "
      print x
      print error
   return error

def moveFiles():
   """
   Move files so that the most recently used set of files ends with _1
      and the previous one gets added to the end
   """
   i = 2
   while True:
      filesuffix = "_"+str(i)+".dat"
      if "A"+filesuffix in os.listdir(os.curdir):
         i += 1
         continue
      else:
         for pre in ["A","b","x","p"]:
            os.system("mv "+pre+"_1.dat "+pre+filesuffix)
            if pre in ["A","x"]:
               pngsuffix = filesuffix[0:-3]+"png"
               os.system("mv "+pre+"_1.png "+pre+pngsuffix)
         return

def createPlots(A,b,x):
   """
   Creates 3 plots for A, 3 for x, and 3 for b
   Prints to screen and saves file
   """
   n = len(A)

   #Plot A matrix
   figA = plt.figure()
   plt.imshow(A, interpolation='nearest', cmap=plt.cm.ocean,
              extent=(0.5,n+0.5,0.5,n+0.5))
   plt.colorbar()
   plt.suptitle("A matrix plot")
   plt.savefig("A_1.png",dpi=72)
   plt.show()

   #Plot x and b together
   ymin = min(min(x),min(b))-0.025
   ymax = 1.025*max(max(x),max(b))
   
   figx = plt.figure()
   plt.subplot(1,2,1)
   plt.plot(range(1,n+1),x,'o-',color="blue")
   plt.xlabel("Entry")
   plt.ylabel("Value")
   plt.title("x Solution Plot")
   plt.ylim(ymin,ymax)
   
   plt.subplot(1,2,2)
   plt.plot(range(1,n+1),b,'o-',color='red')
   plt.xlabel("Entry")
   plt.ylabel("Value")
   plt.title('b Vector Plot')
   plt.ylim(ymin,ymax)

   plt.suptitle("x and b Vector Plots")
   plt.savefig("x_1.png",dpi=72)
   plt.show()


if __name__ == "__main__":
   make_make()
   for i in range(1,4):
      inputs = create_data(i)
      A = inputs["A"]
      b = inputs["b"]
      save_data(A,b,i)
      run_linearSolve() #3 executions: 1 pivot, 2 no pivot, 3 python
      x = python_solve(A,b)
      solution_check(x, "x_1.dat")
      solution_check(x, "p_1.dat")
      createPlots(A,b,x)
      if i!=3: #last test matrix
         moveFiles()
