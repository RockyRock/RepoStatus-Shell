#!/bin/bash
# File to check and display the status of all the git repositories
# within the current working directory
#
# To use this script:
# 1. Place the shell script in the parent directory
# containing all the git repositories
# 2. Run the shell script in terminal
#
# R. Guicherd - March 2020

# Initial check display
echo "=============================================="
echo "Checking status of all Git repositories in cwd"
echo "=============================================="

# For loop to explore all the git repositories in the cwd
for d in */; do
	[[ -d $d/.git ]] && pushd $d && git status && printf "\n\n" && popd>/dev/null;
done;

# Exit message and code return
if test $? -eq 0; then
	echo "========================="
	echo "Git repo check successful"
	echo "========================="
	exit 0
else
	echo "*************************************************"
	echo "!!! Issue in checking git repository statuses !!!"
	echo "*************************************************"
	exit 1
fi;

# End of repo-status.sh script