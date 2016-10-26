!!------------------------------------------------------------------
!! A Fortran example code for finding a root of a user-defined 
!! function f(x) = 0.
!! 
!! This code is written by Prof. Dongwook Lee for AMS 209.
!!
!! This module has two subroutines each of which computes
!!   1. function value evaluated at x,
!!   2. function derivative evaluated at x
!!
!!------------------------------------------------------------------

module ftn_module

  use setup_module, only : ftnType
  implicit none

contains

  subroutine ftn_eval(x,f)
    implicit none
    real, intent(IN)  :: x
    real, intent(OUT) :: f

    !! User specific function description for root finding
    if (ftnType == 1) then
       !! (1) f(x) = x + exp(x) + 10/(1+x^2) - 5
       f = x + exp(x) + 10./(1.+x**2) - 5.
    elseif (ftnType == 2) then
       !! (2) f(x) = (x-1)log_10(x)
       f = (x - 1.) * log10(x)
    elseif (ftnType == 3) then
       f = exp(x)-10.
    elseif (ftnType == 4) then
       f = (x+1.)*(x-2.)
    end if

  end subroutine ftn_eval



  subroutine ftn_derivative(x,fprime)
    implicit none
    real, intent(IN)  :: x
    real, intent(OUT) :: fprime

    real :: h, f1,f2

    !!NUMERICAL DIFFERENTIATION APPROACH
    !!Set value for h. Realistically, we can grab these from init file
    !!However, numerical differentiation is a major problem of its own
    !!So we skip over its logistics here for simplification
    h = 1.e-6
    call ftn_eval((x+h),f1)
    call ftn_eval(x,f2)
    fprime = (f1-f2)/h

!    !! User specific function derivative
!    if (ftnType == 1) then
!       !! (1) derivative of the first function
!       fprime = 1. + exp(x) - 20.*x/(1.+x**2)**2
!    elseif (ftnType == 2) then
!       !! (2) derivative of the second function
!       fprime = log10(x) + (x - 1.)/x
!    end if

  end subroutine ftn_derivative

  
end module ftn_module
