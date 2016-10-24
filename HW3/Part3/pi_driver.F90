
program pi_driver

  !!Include C-type header file - make file extension a F90
!  #include "definition.h"

  !!Define use of module variables and subroutines
  use setup_module,     only : setup_init, threshold, maxIter
  use pi_module,        only : pi_values
  use pi_writeOutput,    only : output_write

  implicit none

  !!Local variables within this scope
  integer :: nIter
  real    :: residual, pi_approx

  real, allocatable, dimension(:) :: pi_hist, res_hist, thresh_hist

  !!Initialize values
  nIter = 0             !Begin summation from 0 term
  residual = 100        !Give large unrealistic residual to enter loop
  pi_approx = 3.14      !Give sample intial pi - this will be overwritten soon

  !!Call setup_init to initialize runtime parameters
  call setup_init()

  !!Allocate arrays with size of user_defined integer value, maxIter
  allocate(pi_hist(maxIter+1))
  allocate(res_hist(maxIter+1))
  allocate(thresh_hist(maxIter+1))

  !!Apply algorithm part of the program
  do while((residual > threshold) .and. (nIter < maxIter))
    !!Add one more term to the summation total - update pi_approx,residual
    call pi_values(nIter,pi_approx,residual)

    !!Store newly updated values into history arrays
    pi_hist(nIter+1) = pi_approx
    res_hist(nIter+1) = residual
    thresh_hist(nIter+1) = threshold !value never changes - only for output

    !!Update iteration number
    nIter = nIter+1
  end do

  !!Print short summary of results onto the screen
  if((nIter < maxIter) .and. (residual < threshold)) then
    print*,"++++++++++++++++++++++++++++++++++++"
    print*,"    Solution Convergence Summary    "
    print*,"++++++++++++++++++++++++++++++++++++"
    print*,"Converged solution pi = ",pi_approx
    print*,"Solution converged in Nstep = ",nIter-1
    print*,"Residual obtained = ",residual
    print*,"Threshold value = ",threshold
    print*,"++++++++++++++++++++++++++++++++++++"
  end if

  !!File output history arrays
  call output_write(nIter-1,pi_hist,res_hist,thresh_hist)

  !!Deallocate arrays that were allocated earlier prior to exiting
  deallocate(pi_hist)
  deallocate(res_hist)
  deallocate(thresh_hist)

end program pi_driver
