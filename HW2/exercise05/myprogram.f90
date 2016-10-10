!Fortran Problem #5
!Compile: gfortran myprogram.f90 -o myprog
!
!Won't accept non-integer inputs for an int variable. Real prints with decimals

program prob4
implicit none

integer :: i
real :: x

open(11,file='input.dat')
read(11,*) x
read(11,*) i
close(11)
write(*,*) 'x=',x,',i=',i

end program prob4
