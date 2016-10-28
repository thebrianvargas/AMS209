#Determines whether inputted list is already sorted
def is_sorted(inList,printBool=False):
   out = False

   if sorted(inList) == inList:
      out = True

   if printBool:
      print out

   return out


if __name__ == "__main__":
   inList = ['a','b','d','c']
   is_sorted(inList,1)
