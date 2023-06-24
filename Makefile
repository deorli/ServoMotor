################################################################################################
#   File           : Makefile
#   Author         : Mateusz Bator
#   Brief          : Startup file for compiling and flashing the SMT32F3 microcontroller
#	#########################################################################################
#   Copyright (c) Bator Mateusz 
#   email: deorli@o2.pl
#   
#   All rights reserved.
#   
#   This software is licensed under terms that can be found in the LICENSE file
#   in the root directory of this software component.
################################################################################################

################################################################################################
#TODO:
#	- Add protection against flashing a program that is too large
#	- Add static analysis
################################################################################################

# When the first parameter is empty (e.g. make)
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS),))
print_information: information
endif

# When the first parameter is "help" (e.g. make help)
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), help))
print_help: help
endif

# Write information in the console on how to use the help command
information:
	@echo     Call: make help \ \ \ \ \ \ \ \ - to get information how to build, debug, compile etc.

# Write information in the console about available commands
help:
	@echo	  #
	@echo	  '###################################################################################################################'
	@echo	  How use this build system:
	@echo	  -------------------------------------------------------------------------------------------------------------------
	@echo	  1. Call: make app  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ -To compile app - Firmware for MCU '('without debug information')'
	@echo	  2. Call: make flash  \ \ \ \ \ \ \ \ \ \ \ \ \ -To compile and flash app - Firmware for MCU '('without debug information')'
	@echo	  3. Call: make debug  \ \ \ \ \ \ \ \ \ \ \ \ \ -To compile App with Debug information
	@echo	  4. Call: make flash-debug  \ \ \ \ \ \ \ -To compile App with Debug information and flash Firmware in MCU
	@echo	  -------------------------------------------------------------------------------------------------------------------
	@echo	  5. Call: make test-report \ \ \ \ \ \ \ -To start compilation or fully recompilation all unit-test
	@echo	  6. Call: make test-start \ \ \ \ \ \ \ \ -Only to rebuild source files and start unit tests
	@echo	  7. Call: make test-coverage \ \ \ \ \ -To refresh coverage report
	@echo	  -------------------------------------------------------------------------------------------------------------------
	@echo	  8. Call: make clean-test \ \ \ \ \ \ \ \ -To delete all test result
	@echo	  9. Call: make clean-docs  \ \ \ \ \ \ \ \ -Remove Docs Folder
	@echo	  -------------------------------------------------------------------------------------------------------------------
	@echo	  10. Call: make clean-build  \ \ \ \ \ \ -Remove build Folder
	@echo	  11. Call: make clean-debug  \ \ \ \ \ \ -Remove build Debug Folder
	@echo	  '###################################################################################################################'

# Attach file for duding and flashing STM32F3
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), app flash debug flash-debug clean-build clean-debug))
include Makefiles/main_Makefile
endif

# Attach file for duding and flashing STM32F3
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), test-report test-start test-coverage clean-test clean-docs))

################################	TODO	########################################
#TODO: Implement uni-test support
####################################################################################

#include Application/Makefile/main_UnitTests_Makefile.mk
endif