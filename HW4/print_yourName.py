#Takes first and last names as a list and capitalizes the first characters 
#of the first and last names

#For now, assume length of names are greater than 1 and inputs are correct
def print_yourName(names,standard=True):
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
