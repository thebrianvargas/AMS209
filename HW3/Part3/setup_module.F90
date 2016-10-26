!Sets up input parameters based off init file for runtime customization
module setup_module

#include "definition.h"

  !!File below used to identify types of inputs - obtain from Dongwook
  use read_initFile_module

  implicit none

  real, save :: threshold
  integer, save :: maxIter
  character(len=MAX_STRING_LENGTH), save :: runName

contains

  !!Subrotuine used to input paramter values from init file
  subroutine setup_init()

    implicit none
   
    !!Call subroutines to read in init file into those variables
    call read_initFileChar('pi_approx.init','run_name',runName)
    call read_initFileInt('pi_approx.init','max_iter',maxIter)
    call read_initFileReal('pi_approx.init','threshold',threshold)

    !!Check to make sure the inputted values are valid
    if (maxIter < 0) then
      print*,"Not a valid max iterations - must be greater than 0"
      print*,"Aborting now!"
      stop
    end if

  end subroutine setup_init

end module setup_module
