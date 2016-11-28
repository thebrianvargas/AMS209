!Writes A and B to screen for sanity check
module write_to_screen

contains

  subroutine print_inputs(A,b,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n), intent(IN) :: b
    real, dimension(n,n), intent(IN) :: A
    
    integer :: i

    !Print A
    print *, "A = "
    do i=1,n
      print *, A(i,:)
    end do

    !Print b
    print *, "b = "
    do i=1,n
      print *, b(i)
    end do

  end subroutine

end module write_to_screen
