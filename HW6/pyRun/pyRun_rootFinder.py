"""

Directory structure:
   hw6/
	|-- newton_rootFinder/	RootFinder.F90
	|			findRootMethod_module.F90
	|			makefile
	|			read_initFile_module.F90
	|			definition.h
	|			ftn_module.F90
	|			output_module.F90
	|			setup_module.F90
	|			(excluding rootFinder.init)
	|
	|-- pyRun/		pyRun_rootFinder.py

"""

#import necessary Python modules
import os
import numpy as np
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt


def adjust_file(fileName):
   #if we already have this file name, rename it to the next number
   if fileName in os.listdir(os.curdir):
      count = 1
      while fileName+"."+str(count) in os.listdir(os.curdir):
         count = count+1
      os.system("mv "+fileName+" "+fileName+"."+str(count))

def make_make():
   """
   Function that interacts with the makefile by compiling and cleaning
      through OS system manipulation
   """
   #change working directory to the one with the Fortran files
   os.chdir("../newton_rootFinder/")
   #if we don't have an executable, compile
   if "rootFinder.exe" not in os.listdir(os.curdir):
      os.system("make")
   #if we do have an executable, clean then compile
   else:
      os.system("make clean")
      os.system("make")


def runtimeParameters_init(threshold,run_name="newton",method_type="newton",x_beg=-10.0,x_end=10.0,max_iter=1000,ftn_type=2,init_guess=1.5,multiplicity=2):
   """
   Creates runtime parameters init file so that .init is the active file
      and .init1 and .init2 etc are the previous files used

   Many default input values are selected with only the threshold required
   """
   #if we already have an init file, rename it to the next number
   adjust_file("rootFinder.init")
   #now the regular init file doesn't exist, create it and write it
   f = open("rootFinder.init","w")
   parameters = ["run_name","method_type","x_beg","x_end","max_iter","threshold","ftn_type","init_guess","multiplicity"]
   for parameter in parameters:
      #write it so run_name and method_type are clear they are strings
      if parameter in ["run_name","method_type"]:
         f.write(parameter+" \t\t\t '"+str(eval(parameter))+"'")
      else:
         f.write(parameter+" \t\t\t "+str(eval(parameter)))
      f.write('\n')
   f.close()


def run_rootFinder():
   """
   Executes the Fortran executable rootFinder.exe incorporating the rootFinder.init
   """
   os.system("./rootFinder.exe")

def plot_data(plotFileName, threshold, adjust=True):
   #import dat file into data array
   data = np.loadtxt("rootFinder_newton.dat")
   #dat files have the following columns: iter, solution, threshold, error

   #same y-scale throughout all figures. we want to make points visible
   ymin = min(min(data[:,1]),min(data[:,3]))-0.025
   ymin = -.025
   ymax = 1.025*max(max(data[:,1]),max(data[:,3]))

   #produce figure: iter vs solutions - plot to both screen and file
   plt.figure(figsize=(8,6),dpi=80)
   plt.subplot(1,2,1)
   plt.plot(data[:,0],data[:,1],'o-',color='blue')
   plt.xlabel("Number of Iterations")
   plt.ylabel("Solutions")
   plt.title("Iterations vs Solutions Plot")
   plt.ylim(ymin,ymax)

   plt.subplot(1,2,2)
   plt.plot(data[:,0],data[:,3],'o-',color='red')
   plt.xlabel("Number of Iterations")
   plt.ylabel("Errors")
   plt.title("Iterations vs Errors Plot")
   plt.ylim(ymin,ymax)

   plt.suptitle('Threshold: '+str(threshold))
   plt.savefig(plotFileName, dpi=72)

   plt.show()

   #if we already have a dat file, rename it to the next number
   if adjust:
      adjust_file("rootFinder_newton.dat")


if __name__ == "__main__":
   #run these functions only if we want to actually use them
   #ie, dont run make_make if we don't want to recompile or clean
   #    don't run runtimeParamters_init if we don't want to create a new file

   #use these particular input parameters
   my_ftn_type = 2
   thresholds = ["1.e-4","1.e-6","1.e-8"]
   initial_guess = [1.5,50]

   #set runtime parameters, call functions properly to execute fortran code
   #  used for 3 different thresholds on same function for comparison
   i = 1
   make_make()
   for threshold in thresholds:
      #obtain results for farther initial guess
      runtimeParameters_init(threshold,ftn_type=my_ftn_type,init_guess=1000,x_end=10000)
      run_rootFinder()
      plotName = "far_result_"+str(my_ftn_type)+"_"+str(threshold)+".png"
      #don't readjust dat file names if it's the last element
      plot_data(plotName, threshold, adjust=not (i==len(thresholds)))

      #obtain results for close initial guess
      runtimeParameters_init(threshold,ftn_type=my_ftn_type,init_guess=1.5)
      run_rootFinder()
      plotName = "close_result_"+str(my_ftn_type)+"_"+str(threshold)+".png"
      plot_data(plotName, threshold, adjust=not (i==len(thresholds)))

      i = i+1
