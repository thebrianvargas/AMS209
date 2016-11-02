"""
Brian Vargas (bvargas6@ucsc.edu)
AMS209 Foundations of Scientific Computing
Homework #4 - Problem #5
print_yourName.py
"""
def print_yourName(names,standard=True):
   """
   Takes first and last names and capitalizes the first characters of each name

   Inputs:
      * names     List containing [last name,first name]
      * standard  Boolean that identifies whether to print in standard form

   Outputs:
      If standard, (First name) (Last name)
      Otherwise,   (Last name), (First name)
   """
   #For now, assume length of names are greater than 1 and inputs are correct

   #Read in the inputs
   firstName = names[0]
   lastName = names[1]

   #Fix the names for output
   firstName = firstName[0].upper()+firstName[1:]
   lastName = lastName[0].upper()+lastName[1:]

   #Print our name the way it's requested
   if standard:
      print firstName+' '+lastName
   else:
      print lastName+', '+firstName
   return

if __name__ == "__main__":
   #predefined names list to test my function works
   names = ['brian','vargas']
   print_yourName(names)
   print_yourName(names,True)
   print_yourName(names,False)
