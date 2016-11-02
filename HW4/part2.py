"""
Brian Vargas (bvargas6@ucsc.edu)
AMS209 Foundations of Scientific Computing
Homework #4 - Problem 2
part2.py
"""

def do_twice(f,value):
   """
   Calls a function twice

   Inputs:
      * f      Function being called twice
      * value  Inputted value to be passed as a parameter to f
   """
   f(value)
   f(value)

#takes a string as a parameter and prints it twice
def print_twice(value):
   """
   Takes a string as a paramter and prints it twice

   Inputs:
      * value   Inputted value to be printed twice
   """
   print value
   print value


if __name__ == "__main__":
   do_twice(print_twice,"spam")
