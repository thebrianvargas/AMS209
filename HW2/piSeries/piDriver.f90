!Brian Vargas
!piDriver.f90
!
!Approximates pi to a particular threshold and max iterations
program piDriver
implicit none

real :: threshold, newPI, series
real, dimension(4) :: thresholds = (/ 1.d-4, 1.d-8, 1.d-12, 1.d-16 /)
integer :: nmax=100, i


do i=1,4
  threshold = thresholds(i)
  write(*,*) "Threshold=",threshold
  newPI = series(nmax, threshold)
enddo

!How to run in general:
!newPI = series(nmax, threshold)

end program piDriver
