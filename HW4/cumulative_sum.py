#Computes cumulative sum of inputted numerical list
def cumulative_sum(inList, printList=False):
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
   cumulative_sum(inList)
