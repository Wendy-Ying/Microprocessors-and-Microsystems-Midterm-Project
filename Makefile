# Makefile

# 1. Make sort_file: list files/directories by file size
sort_file:
	@echo "Listing files and directories by file size:"
	@ls -lhS

# 2. Make find_log: find log files in the home directory
find_log:
	@echo "Finding log files in the home directory:"
	@find ~/ -name "*.log"

# 3. Make delete_lock_file: find and delete lock files in the home directory
delete_lock_file:
	@echo "Finding and deleting lock files in the home directory:"
	@find $(HOME) -name "*.lock" -print -exec rm -f {} \;
	@echo "All lock files deleted."

# Default target
all: sort_file find_log delete_lock_file

