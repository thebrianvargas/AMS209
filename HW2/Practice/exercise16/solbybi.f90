!Fortran Problem #16
!
!Compile: gfortran fcosx.f90 bisect.f90 solbybi.f90 -o bi
!
!Link function,subroutine,program for bisection method
program solbybi
implicit none

real, parameter :: xmin=0.0, xmax=2.0
integer, parameter :: iter = 10
real :: sol,err,fcosx
external fcosx

call bisect(xmin,xmax,sol,fcosx,iter,err)

write(*,*) sol,err

end program solbybi
