"""
Brian Vargas (bvargas6@ucsc.edu)
AMS209 Foundations of Scientific Computing
Homework #4 - Problem #3
is_sorted.py
"""
def is_sorted(inList,printBool=False):
   """
   Determines whether inputted list is already sorted

   Inputs:
      * inList     Inputted list used to check if already sorted
      * printBool  Boolean that determines whether we print the output

   Outputs:
      * out        Boolean identifying whether it was already sorted or not
   """
   out = False

   #Compares sorted version of list with the original version
   if sorted(inList) == inList:
      out = True

   if printBool:
      print out

   return out


if __name__ == "__main__":
   inList = ['a','b','d','c']
   is_sorted(inList,True)
