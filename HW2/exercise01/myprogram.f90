!Fortran Problem #1
!Compile: gfortran myprog.f90 -o myprog
!
!Compiles fine, nothing prints. Seems to run fine though.
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

end program nameofprogram
