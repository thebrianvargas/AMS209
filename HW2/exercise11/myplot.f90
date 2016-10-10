!Fortran Problem #11
!Compile: gfortran myplot.f90 fcosx.f90 -o myplot
!
!Generates x,y coordinates with appended function, separate function
program plotfunction
implicit none

integer :: i
real :: x, y, f
!parameters are fixed -  don't change within the program
real, parameter :: xmin = 0., xmax=10., a=-2

open(10,file='myplot.dat')
do i=1,100
   x = xmin+xmax*(i-1.0)/(100.0-1.0)
   y = f(x,a)
   write(10,*) x,y
enddo
close(10)

end program plotfunction
