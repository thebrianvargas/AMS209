!Fortran Problem #8
!Compile: gfortran myprog.f90 -o myprog
!
!Generates x,y coordinates with appended function, no a
program plotfunction
implicit none

integer :: i
real :: x, y, f
!parameters are fixed -  don't change within the program
real, parameter :: xmin = 0., xmax=10., a=-2

open(10,file='myplot.dat')
do i=1,100
   x = xmin+xmax*(i-1.0)/(100.0-1.0)
   y = f(x)
   write(10,*) x,y
enddo
close(10)

end program plotfunction

function f(x)
implicit none
real :: f,x,a

f = cos(x+a)
end function f
