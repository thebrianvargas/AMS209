!Fortran Problem #4
!Compile: gfortran myprogram.f90 -o myprog
!
!Won't accept non-integer inputs for an int variable. Real prints with decimals

program prob4
implicit none

integer :: i
real :: x

write(*,*) 'What is the value of x?'
read(*,*) x
write(*,*) 'What is the value of i?'
read(*,*) i
write(*,*) 'x=',x,',i=',i

end program prob4
