!Contains subroutines used to solve backward substitution Ux=y
module backward_solve

contains

  !!Input U nxn matrix, y nx1 vector to solve Ux=y
  !!Output y nx1 vector as the solution
  subroutine Usolve(U,y,n,x)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(IN) :: U
    real, dimension(n), intent(IN) :: y
    real, dimension(n), intent(OUT) :: x

    integer :: i,j
    real :: sub

    !Initialize solution vector first
    do i=1,n
      x(i) = 0
    end do

    !Backward iteration to obtain vector backwards
    do i=n,1,-1
      sub = 0
      if (i/=n) then
        do j=(i+1),n
          sub = sub+U(i,j)*x(j)
        end do
      end if
      x(i) = (y(i)-sub)/U(i,i)
    end do    

  end subroutine Usolve

end module backward_solve
