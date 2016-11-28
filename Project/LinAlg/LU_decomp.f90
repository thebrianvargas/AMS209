!Obtains the LU Decomposition by either partial pivoting or not
module LU_decomp

contains

  !!LU Decomposition without partial pivoting
  subroutine getLU(A,n,LU)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(IN) :: A
    real, dimension(n,n), intent(OUT) :: LU

    integer :: j
    real, dimension(n,n) :: A2

    A2 = A !PRESERVE INPUTS
    do j=1,(n-1) !column-major
      !Gaussian elimination step
      call gaussian(LU,A2,j,n)
    end do

    call combineU(LU,A2,n)

  end subroutine getLU

  !!LU Decomposition with partial pivoting
  subroutine getPLU(A,n,LU,b)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(IN) :: A
    real, dimension(n,n), intent(OUT) :: LU
    real, dimension(n), intent(INOUT) :: b

    integer :: j
    real, dimension(n,n) :: A2

    !Preserve inputs
    A2 = A
    do j=1,(n-1) !column-major
      !Partial pivot step
      call pivot(LU,A2,b,j,n)
      !Gaussian elimination step
      call gaussian(LU,A2,j,n)
    end do

    call combineU(LU,A2,n)

  end subroutine getPLU

  !!Partial pivoting step for 1 iteration
  subroutine pivot(LU,A,b,j,n)
    implicit none
    integer, intent(IN) :: n,j
    real, dimension(n,n), intent(INOUT) :: LU,A
    real, dimension(n), intent(INOUT) :: b

    real :: largest
    integer :: k

    largest = maxval(abs(A((j+1):n,j)))
    if (A(j,j) /= largest) then
      print *, "Pivot needed!!"
      k = j+maxloc(abs(A((j+1):n,j)),1)
      print *,k
      call mRowSwap(A,n,j,k)
      call mRowSwap(LU,n,j,k)
      call vRowSwap(b,n,j,k)
    end if

  end subroutine pivot

  !!Gaussian elimination step for 1 column
  subroutine gaussian(LU,A,j,n)
    implicit none
    integer, intent(IN) :: n,j
    real, dimension(n,n), intent(INOUT) :: LU,A

    integer :: i
    real, dimension(n,n) :: M

    call eye(n,M)
    do i=(j+1),n
      LU(i,j) = A(i,j)/A(j,j)
      M(i,j) = -A(i,j)/A(j,j)
    end do
    A = matmul(M,A)

  end subroutine gaussian

  !!Combines U into LU matrix
  subroutine combineU(LU,U,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(IN) :: U
    real, dimension(n,n), intent(INOUT) :: LU

    integer :: i,j
    do j=1,n
      do i=1,j
        LU(i,j) = U(i,j)
      end do
    end do

  end subroutine combineU

  !!Swaps rows i and j of nxn matrix A
  subroutine mRowSwap(A,n,i,j)
    implicit none
    integer, intent(IN) :: n,i,j
    real, dimension(n,n), intent(INOUT) :: A

    real, dimension(n) :: temp

    !Swap with intermediate variable
    temp = A(i,:)
    A(i,:) = A(j,:)
    A(j,:) = temp

  end subroutine mRowSwap

  !!Swap entries i and j of a nx1 vector
  subroutine vRowSwap(b,n,i,j)
    implicit none
    integer, intent(IN) :: n,i,j
    real, dimension(n), intent(INOUT) :: b

    real :: temp

    !Swap with intermediate variable
    temp = b(i)
    b(i) = b(j)
    b(j) = temp

  end subroutine vRowSwap

!!!NOTE: we could combine partial pivoting into normal gaussian and only
!activate it when we find that the user is asking for it via a conditional
!statement - keep P as an identity so that b doesn't change

  !!Create identity matrix of dimension n
  subroutine eye(n,Id)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(OUT) :: Id

    integer :: i,j
    do i=1,n
      do j=1,n
        if (i==j) then
          Id(i,i) = 1
        else
          Id(i,j) = 0
        end if
      end do
    end do

  end subroutine eye

end module LU_decomp
