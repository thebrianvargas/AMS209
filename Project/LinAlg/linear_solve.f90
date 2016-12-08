!Driver for LU solving
program linear_solve

  use forward_solve,    only : Lsolve
  use backward_solve,   only : Usolve
  use write_data,       only : write_solution
  use write_to_screen,  only : print_inputs, print_matrix, print_vector
  use LU_decomp,        only : getLU, getPLU
  use read_data,        only : setup, n, A, b

  implicit none

  real, allocatable, dimension(:,:) :: LU
  real, allocatable, dimension(:) :: x,y

  character(len=7) :: outFile
  integer :: i

  call setup("b_1.dat","A_1.dat")
  call print_inputs(A,b,n)

  !Now that we have n, allocate the other matrices
  allocate(LU(n,n))
  allocate(x(n))
  allocate(y(n))

  do i=1,2
    if (i==1) then
      print*,"LU without Pivoting"
      call getLU(A,n,LU)
      outFile = "x_1.dat"
    else
      print*,"LU with Partial Pivoting"
      call getPLU(A,n,LU,b)
      outFile = "p_1.dat"
    end if
!    print*,"'LU' = "
!    call print_matrix(LU,n)

    call Lsolve(LU,b,n,y)
!    print *,"y = "
!    call print_vector(y,n)

    call Usolve(LU,y,n,x)
    print *,"x = "
    call write_solution(outFile,x,n)
  end do
  print *,' '

  !Deallocate everything we allocated
  deallocate(x)
  deallocate(y)
  deallocate(b)
  deallocate(LU)
  deallocate(A)

end program linear_solve
