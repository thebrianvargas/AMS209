!Brian Vargas
!series.f90
!
!Function computing "infinite" series for pi
function series(nmax,threshold)
implicit none

integer :: n,nmax
real :: s, pi, threshold, diff, series, newterm

pi = acos(-1.d0)
s = 0
do n=0,nmax
  s = s+16.**(-1.*n)*(4./(8.*n+1.)-2./(8.*n+4.)-1./(8.*n+5.)-1./(8.*n+6.))
  diff = abs(pi-s)
  if(diff.le.threshold) exit
enddo

series = s
write(*,*) "newPi=",s
write(*,*) "diff=",diff
write(*,*) "N=",n
write(*,*) " "

end function series
