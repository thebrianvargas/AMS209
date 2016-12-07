!Driver for LU solving
program linear_solve

  use forward_solve,    only : Lsolve
  use backward_solve,   only : Usolve
  use write_data,       only : write_solution
  use write_to_screen,  only : print_inputs, print_matrix, print_vector
  use LU_decomp,        only : getLU, getPLU
  use read_data,        only : setup, n, A, b

  implicit none

  !!Testing my current code for particular case all in Fortran
!  integer, parameter :: n=4
!  integer :: n

!  real, dimension(:) :: b
!  call read_vector("b_1.dat",b)

  real, allocatable, dimension(:,:) :: LU
  real, allocatable, dimension(:) :: x,y

!  real, dimension(n,n) :: LU,A
!  real, dimension(n) :: x,y,b

  character(len=7) :: outFile
  integer :: i

   !Testing purposes
!  LU = transpose(reshape((/2.,1.,1.,0.,2.,1.,1.,1.,4.,3.,2.,2.,3.,4.,1.,2./), (/n,n/)))
!  A = transpose(reshape((/2.,1.,1.,0.,4.,3.,3.,1.,8.,7.,9.,5.,6.,7.,9.,8./), (/n,n/)))
!  b = (/3.,6.,10.,1./)

  !Print matrix by row
!  print *, "LU = "
!  do i=1,n
!    print *, LU(i,:)
!  end do

!  call read_matrix("A_1.dat",n,A)
!  call read_vector("b_1.dat",n,b)

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

!  call getLU(A,n,LU)
!  print*,"'LU' = "
!  call print_matrix(LU,n)

!  call Lsolve(LU,b,n,y)
!  print *, "y = "
!  call print_vector(y,n)

!  call Usolve(LU,y,n,x)
!  print *, "x = "
!  call write_solution("x_1.dat",x,n)

  !Deallocate everything we allocated
  deallocate(x)
  deallocate(y)
  deallocate(b)
  deallocate(LU)
  deallocate(A)

end program linear_solve
