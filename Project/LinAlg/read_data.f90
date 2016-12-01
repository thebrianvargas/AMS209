!Reads in matrices and vectors from A_i.dat and b_i.dat respectively
module read_data

implicit none
integer, save :: n
real, allocatable, dimension(:), save :: b
real, allocatable, dimension(:,:), save :: A

contains

  !!Driver routine for setting up the input data
  subroutine setup(bname,Aname)
    implicit none
    character(len=7), intent(IN) :: bname,Aname
 
    call get_n(bname)
    call read_vector(bname)
    call read_matrix(Aname)

  end subroutine setup

  !!Obtains the value of n by reading vector file
   !Since it is the smaller of the two files
  subroutine get_n(filename)
    implicit none
    character(len=7), intent(IN) :: filename

    integer :: ios
    real :: dummy

    !Adds number of real entries til EOF
    n = 0
    open(12,file=filename)
    do
      read(12,*,iostat=ios) dummy
      if (ios/=0) then
        exit
      end if
      n = n+1
    end do
    close(12)

  end subroutine

  !!Reads in vector b and gets size n
  subroutine read_vector(bname)
    implicit none
    character(len=7), intent(IN) :: bname

    !Now n is known, we can allocate and fill
    open(12,file=bname)
    allocate(b(n))
    read(12,*) b
    close(12)

  end subroutine read_vector

  !!Reads in matrix A
  subroutine read_matrix(Aname)
    implicit none
    character(len=7), intent(IN) :: Aname

    !n is known - allocate and fill
    allocate(A(n,n))
    open(13,file=Aname)
    read(13,*) A
    A = transpose(A)
    close(13)

  end subroutine read_matrix

end module read_data
