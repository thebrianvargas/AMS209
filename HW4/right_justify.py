#right justifies string so that last character is in column 70

def right_justify(s):
   #string too big to place last character in column 70
   if len(s) > 70:
      print "Inputted string is too long"
      return
   #string is the length needed to require no manipulation
   elif len(s) == 70:
      print s
      return
   #the case in which the string is short enough and needs to be manipulated
   print ' '*(70-len(s))+s
   return

if __name__ == "__main__":
   #s = raw_input("Enter string: ")
   s = "Brian Vargas" #used as default to print to output file in terminal
   right_justify(s)
