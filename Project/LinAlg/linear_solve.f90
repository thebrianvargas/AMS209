!Driver for LU solving
program linear_solve

  use forward_solve,    only : Lsolve
  use backward_solve,   only : Usolve
  use write_data,       only : write_solution
  use write_to_screen,  only : print_inputs
  use LU_decomp,        only : getLU,getPLU

  implicit none

  !!Testing my current code for particular case all in Fortran
  integer, parameter :: n=4
  real (kind=8), dimension(n,n) :: LU,A
  real (kind=8), dimension(n) :: x,y,b

  integer :: i

!  LU = transpose(reshape((/2.,1.,1.,0.,2.,1.,1.,1.,4.,3.,2.,2.,3.,4.,1.,2./), (/n,n/)))
  A = transpose(reshape((/2.,1.,1.,0.,4.,3.,3.,1.,8.,7.,9.,5.,6.,7.,9.,8./), (/n,n/)))
  b = (/3.,6.,10.,1./)

  !Print matrix by row
!  print *, "LU = "
!  do i=1,n
!    print *, LU(i,:)
!  end do

  call print_inputs(A,b,n)

  call getLU(A,n,LU)
  call print_inputs(LU,b,n)

  call Lsolve(LU,b,n,y)
  print *, "y = "
  call write_solution(y,n)

  call Usolve(LU,y,n,x)
  print *, "x = "
  call write_solution(x,n)

end program linear_solve
