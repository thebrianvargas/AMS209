!Writes result to screen as well as to a file
module write_data

  use write_to_screen,  only : print_vector

contains

  !Print solution to screen and file x.dat
  subroutine write_solution(filename,x,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n), intent(IN) :: x
    character(len=7), intent(IN) :: filename

    integer :: i

    !Print solution to screen and onto file
    call print_vector(x,n)
    open(13,file=filename)
    do i=1,n
      write(13,*) x(i)
    end do

  end subroutine write_solution

end module write_data
