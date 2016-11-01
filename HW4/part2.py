#does a function twice. takes in function object and a value which passes on
def do_twice(f,value):
   f(value)
   f(value)

#takes a string as a parameter and prints it twice
def print_twice(value):
   print value
   print value


if __name__ == "__main__":
   do_twice(print_twice,"spam")
