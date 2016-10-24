!Fix format specifier so it matches what we want

module pi_writeOutput

  use setup_module, only : runName
  implicit none

contains

  subroutine output_write(length,pis,residuals,thresh)
    implicit none
    integer, intent(IN) :: length
    real, dimension(:), intent(IN) :: pis,residuals,thresh
    integer :: i
    character(len=35) :: ofile

    !!File name for ascii output
    ofile = 'pi_'//trim(runName)//'.dat'

    !!Open file
    open(unit=20,file=ofile,status='unknown')

    !!Write into file: n,pi approx, residual, and threshold
    do i=1,(length+1)
      write(20,920) (i-1),pis(i),residuals(i),thresh(i)
    end do

    !!Output format specifier
    920 format(1x, i5, f20.16, 1x, f18.16, 1x, f18.16)

    !!Close file
    close(20)

  end subroutine output_write
    
end module pi_writeOutput
