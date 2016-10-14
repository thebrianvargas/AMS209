!Fortran Problem #3
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

!write(*,*) 'x=',x,',y=',y,',z=',z,',i=',i,',j=',j,',k=',k
!Alternatively can write into a file
open(10,file="output.txt")
write(10,*) 'x=',x,',y=',y,',z=',z,',i=',i,',j=',j,',k=',k
close(10)

end program nameofprogram
