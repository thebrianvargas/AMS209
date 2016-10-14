!Fortran Problem #16
!
!Compile: gfortran fcosx.f90 bisect.f90 solbybi.f90 -o bi
!
!Combines subroutine, function, and program files
subroutine bisect(xmin, xmax, sol, func, iter, err)
implicit none

real :: xmin, xmax, sol, func
integer :: iter
real :: x1,x2,res,err
integer :: i
external func

x1 = xmin
x2 = xmax
!check for unique solution
res = func(x1)*func(x2)
if(res.gt.0.0) then
  write(*,*) "There is no solution or multiple solutions in this interval"
  write(*,*) 'Try again with a different interval'
endif

do i=1,iter
  sol = (x1+x2)/2. !get midpoint
  res = func(sol)*func(x2)
  if(res.gt.0.0) then
    x2 = sol !solution between x1 and sol, shrink x2
  else
    x1 = sol !solution between x2 and sol, shrink x1
  endif
enddo

sol = (x2+x1)/2.
err = (x2-x1)/2.

end subroutine bisect
