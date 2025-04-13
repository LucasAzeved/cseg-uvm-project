# Default to call help
all: help

# Target for RegFile
regFile:
	@echo "Running RegFile tasks..."
	jg RegFile/fpv.tcl -allow_unsupported_OS

# Target for DataMemory
dataMemory:
	@echo "Running DataMemory tasks..."
	jg DataMemory/fpv.tcl -allow_unsupported_OS

# Help to show options
help:
	@echo "Available targets:"
	@echo "  make regFile    - Run tasks for DataMemory"
	@echo "  make dataMemory - Run tasks for RegFile"
