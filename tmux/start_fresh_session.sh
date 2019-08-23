#!/bin/bash

function start_fresh_session {
	tmux has-session -t main
	echo $?

	if [ $? != 0 ]; then
		tmux new-session -d -s main
		tmux send -t main "C-a C-R"
	else
		tmux attach -t main
	fi
}

export -f start_fresh_session
