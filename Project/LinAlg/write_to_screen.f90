!Module dealing with printing results to the screen
module write_to_screen

contains

  !!Prints input matrices A and b to screen for sanity check
  subroutine print_inputs(A,b,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n), intent(IN) :: b
    real, dimension(n,n), intent(IN) :: A

    print*,"A = "
    call print_matrix(A,n)
    print*,"b = "
    call print_vector(b,n)

  end subroutine

  !!Prints matrix to screen in nicely manner
  subroutine print_matrix(A,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n,n), intent(IN) :: A

    integer :: i
    do i=1,n
      print *, A(i,:)
    end do

  end subroutine

  !!Prints vector to screen in nicely manner
  subroutine print_vector(b,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n), intent(IN) :: b

    integer :: i
    do i=1,n
      print *,b(i)
    end do

  end subroutine print_vector
 

end module write_to_screen
