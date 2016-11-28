!Contains subroutines used to solve forward substitution Ly=b
module forward_solve

contains

  !!Input L nxn matrix, and b nx1 vector to solve Ly=b
  !!Output y nx1 vector as the solution
  subroutine Lsolve(L,b,n,y)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(IN) :: L
    real, dimension(n), intent(IN) :: b
    real, dimension(n), intent(OUT) :: y

    integer :: i,j
    real :: sub

    do i=1,n
      sub = 0
      if (i/=1) then
        do j=1,(i-1)
          sub = sub+L(i,j)*y(j)
        end do
      end if
      y(i) = b(i)-sub
    end do

  end subroutine Lsolve

end module forward_solve
