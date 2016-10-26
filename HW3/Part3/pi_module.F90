!Contains subroutines used to execute algorithm
module pi_module

contains
  
  !!Input nIter so we can call subroutines to gather output values
  subroutine pi_values(nIter,pi_approx,residual)
    implicit none
    integer, intent(IN) :: nIter
    real, intent(OUT) :: pi_approx,residual

    !!Gather values by calling subroutines below
    call pi_summation(nIter,pi_approx)
    call pi_residual(pi_approx,residual)
  end subroutine pi_values


  !!Input nIter, sum terms and output pi_approx
  subroutine pi_summation(nIter,pi_approx)
    implicit none
    integer, intent(IN) :: nIter
    real, intent(OUT) :: pi_approx

    !!Define iteration variable and initialize pi_approx
    integer :: n
    real :: newTerm
    pi_approx = 0

    !!Calculate the sum for the first n terms
    do n=0,nIter
!newTerm=
      pi_approx = pi_approx+16.**(-1.*n)*(4./(8.*n+1.)-2./(8.*n+4.)-1./(8.*n+5.)-1./(8.*n+6.))
!      pi_approx = pi_approx+newTerm
    enddo
  end subroutine pi_summation


  !!Input pi_approx and output residual to true pi
  subroutine pi_residual(pi_approx,residual)
    implicit none
    real, intent(IN) :: pi_approx
    real, intent(OUT) :: residual

    !!Define true value of pi
    real :: pi
    pi = acos(-1.d0)

    !!Compute residual for pi_approx
    residual = abs(pi-pi_approx)
  end subroutine pi_residual

end module pi_module
