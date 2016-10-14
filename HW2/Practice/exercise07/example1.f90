!Fortran Problem #7
!Compile: gfortran myprog.f90 -o myprog
!
!Generates x,y coordinates with function in program
program plotfunction
implicit none

integer :: i
real :: x
!parameters are fixed -  don't change within the program
real, parameter :: xmin = 0., xmax=10., a=-2

open(10,file='myplot.dat')
do i=1,100
   x = xmin+xmax*(i-1.0)/(100.0-1.0)
   write(10,*) x,f(x)
enddo
close(10)

contains

function f(x)
implicit none
real :: f,x
f = cos(x+a)
end function f

end program plotfunction
