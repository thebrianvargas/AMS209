!Obtains the LU Decomposition by either partial pivoting or not
module LU_decomp

contains

  !!LU Decomposition without partial pivoting
  subroutine lu(A,n,LU)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(IN) :: A
    real, dimension(n,n), intent(OUT) :: LU

    integer :: i,j
    real, dimension(n,n) :: M,A2

    !Gaussian elimination step
    A2 = A
    do i=1,(n-1)
      M = eye(n)
      do j=(i+1),n
        LU(i,j) = A(i,j)/A(i,i)
        M(i,j) = -A(i,j)/A(i,i)
      end do
      A2 = matmul(M,A2)
    end do

    !Remaining A2 is U - copy it onto top of LU to save memory
    do i=1,n
      do j=1,i
        LU(i,j) = A2(i,j)
      end do
    end do

  end subroutine lu

  !!Create identity matrix of dimension n
  subroutine eye(I,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(OUT) :: I

    integer :: i,j
    do i=1,n
      do j=1,n
        if (i==j) then
          I(i,i) = 1
        else
          I(i,j) = 0
        end if
      end do
    end do

  end subroutine eye

!  subroutine plu(A,n,b)

!  end subroutine

end module LU_decomp
