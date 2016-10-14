!Fortran Problem #2
!Compile: gfortran myprog.f90 -o myprog
!
!Compiles fine. Prints reals a bit funny.
program nameofprogram
implicit none

integer :: i,j,k
real :: x,y,z

x = 3.61
y = cos(x)
z = x+y

i = 3
j = i**2
k = i-j

write(*,*) 'x=',x,',y=',y,',z=',z,',i=',i,',j=',j,',k=',k

end program nameofprogram
