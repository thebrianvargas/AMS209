!Writes result to screen as well as to a file
module write_data

contains

  !Print solution to screen and file x.dat
  subroutine write_solution(x,n)
    implicit none
    integer, intent(IN) :: n
    real, dimension(n), intent(IN) :: x

    integer :: j
    do j=1,n
      write(6,*) x(j)
    end do

  end subroutine write_solution

end module write_data
