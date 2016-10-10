!Fortran Problem #13
!
!Compile: gfortran addmats.f90 -o addmats
!
!Static allocation arrays; column major; better print
program addmats
implicit none

integer, parameter:: dimmat = 3
real, dimension(dimmat,dimmat) :: a,b,c
integer :: i,j

!Create the matrices - diagonal & superdiagonal
a(1,2) = 2.0
do i=2,dimmat-1
   a(i,i+1)=2.0
   b(i,i-1)=1.0
end do
b(dimmat,dimmat-1) = 1.0

!Add the matrices
do i=1,dimmat
  do j=1,dimmat
    c(i,j) = a(i,j)+b(i,j)
  enddo
enddo

!Print matrix
do i=1,dimmat
  write(*,*) ( c(i,j),j=1,dimmat)
enddo
!Notice not every element is initialized as 0

end program addmats
