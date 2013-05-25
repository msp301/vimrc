# Bash aliases

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias()
{
	local name=$1 value="$2"
	echo alias $name=\'$value\' >>~/.bash_aliases
	eval alias $name=\'$value\'
	alias $name
}

# Function which ensures the user is certain that they want to
# permanently remove a file
rm()
{
	# Determine number of times asked
	if [ -z "$RM_COUNT" ]; then
		RM_COUNT=0
	else
		RM_COUNT=$(( $RM_COUNT + 1 ))
	fi

	local ques_start='Are you sure you'
	local ques_end='want to do this?'

	# Check user is sure
	for i in `seq 0 $RM_COUNT`; do
		ques_start="$ques_start really"
	done

	echo "$ques_start $ques_end"
}
