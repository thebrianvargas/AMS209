"""
Brian Vargas (bvargas6@ucsc.edu)
AMS209 Foundations of Scientific Computing
Homework #4 - Problem #4
cumulative_sum.py
"""

def cumulative_sum(inList, printList=False):
   """
   Computes the cumulative sume of inputted numerical list

   Inputs:
      * inList     Inputted list containing numerical values to be summed
      * printList  Boolean that determines whether we print our output or not

   Outputs:
      * outList    List containing the cumulative sums from the inputted list
   """
   #initialize output list variable
   outList = [None]*len(inList)
   outList[0] = inList[0]

   #most efficient way: add next inList term to running total
   for i in range(1,len(inList)):
      outList[i] = outList[i-1]+inList[i]

   #Added feature: print list
   if printList:
      print outList

   return outList


if __name__ == "__main__":
   inList = [1,2,3]
   cumulative_sum(inList,True)
