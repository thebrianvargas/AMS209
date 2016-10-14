!Fortran Problem #6
!Compile: gfortran arithmetic.f90 -o arith
!
!Prints first 10 terms of arithmetic series.
program arithmetic
implicit none

integer :: iter, maxterms
real :: a0, d, res

write(*,*) 'What is the value of a0?'
read(*,*) a0
write(*,*) 'What is the value of d?'
read(*,*) d
write(*,*) 'How many terms?'
read(*,*) maxterms

open(10,file="output.txt")
do iter=1,maxterms
   write(10,*) iter, a0
   a0 = a0+d
enddo
close(10)

end program arithmetic
