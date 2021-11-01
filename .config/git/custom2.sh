# ANSI color escape sequences. Useful else, not just the prompt.
C_Red='\e[2;31m';       C_BRed='\e[1;31m';      C_Green='\e[2;32m';
C_BGreen='\e[1;32m';    C_Yellow='\e[2;33m';    C_BYellow='\e[1;33m';
C_Grey='\e[2;37m';      C_Reset='\e[0m';        C_BPink='\e[1;35m';
C_Italic='\e[3m';       C_Blue='\e[2;34m';      C_BBlue='\e[1;34m';
C_Pink='\e[2;35m';      C_Cyan='\e[2;36m';      C_BCyan='\e[1;36m'

# Values '1' or '2' are valid, for new and old versions, respectively.
PROMPT_STYLE=2

PROMPT_PARSER(){
	if [ $PROMPT_STYLE -eq 1 ]; then
		if git rev-parse --is-inside-work-tree &> /dev/null; then
			local Status=`git status -s`
			if [ -n "$Status" ]; then
				local StatusColor=$C_BRed
			else
				local StatusColor=$C_BGreen
			fi

			local Top=`git rev-parse --show-toplevel`
			read Line < "$Top"/.git/HEAD
			local Branch="$C_Italic$StatusColor${Line##*/}$C_Reset "
		fi

		if [ $1 -gt 0 ]; then
			local Exit="$C_BRed🗴$C_Reset"
		else
			local Exit="$C_BGreen🗸$C_Reset"
		fi

		local Basename=${PWD##*/}
		local Dirname=${PWD%/*}

		if [ "$Dirname/$Basename" == '/' ]; then
			CWD="$C_Italic$C_BGreen/$C_Reset"
		else
			CWD="$C_Grey$Dirname/$C_Italic$Basename$C_Reset"

			# If the CWD is too long, just show basename with '.../' prepended, if
			# it's valid to do so. I think ANSI escape sequences are being counted
			# in its length, causing it not work as it should, but I like the
			# result, none-the-less.
			local Slashes=${CWD//[!\/]/}
			TempColumns=$((COLUMNS + 20)) # <-- Seems to work around sequences.
			if ((${#CWD} > (TempColumns - ${#Branch}) - 2)); then
				if [ ${#Slashes} -ge 2 ]; then
					CWD="$C_Grey.../$C_Reset$C_BGreen$Basename$C_Reset"
				else
					CWD=$C_BGreen$Basename$C_Reset
				fi
			fi
		fi

		PS1="$Exit $Branch$CWD\n: "

		unset Line
	elif [ $PROMPT_STYLE -eq 2 ]; then
		X=$1
		(( $X == 0 )) && X=

		if git rev-parse --is-inside-work-tree &> /dev/null; then
			GI=(
				'≎' # Clean
				'≍' # Uncommitted changes
				'≭' # Unstaged changes
				'≺' # New file(s)
				'⊀' # Removed file(s)
				'≔' # Initial commit
				'∾' # Branch is ahead
				'⮂' # Fix conflicts
				'!' # Unknown (ERROR)
				'-' # Removed file(s)
			)

			Status=`git status 2> /dev/null`
			Top=`git rev-parse --show-toplevel`

			local GitDir=`git rev-parse --git-dir`
			if [ "$GitDir" == '.' ] || [ "$GitDir" == "${PWD%%/.git/*}/.git" ]; then
				Desc="${C_BRed}∷  ${C_Grey}Looking under the hood..."
			else
				if [ -n "$Top" ]; then
					# Get the current branch name.
					IFS='/' read -a A < "$Top/.git/HEAD"
					local GB=${A[${#A[@]}-1]}
				fi

				# The following is in a very specific order of priority.
				if [ -z "$(git rev-parse --branches)" ]; then
					Desc="${C_BCyan}${GI[5]}  ${C_Grey}Branch '${GB:-?}' awaits its initial commit."
				else
					while read -ra Line; do
						if [ "${Line[0]}${Line[1]}${Line[2]}" == '(fixconflictsand' ]; then
							Desc="${C_BCyan}${GI[7]}  ${C_Grey}Branch '${GB:-?}' has conflict(s)."
							break
						elif [ "${Line[0]}${Line[1]}" == 'Untrackedfiles:' ]; then
							NFTTL=0
							while read -a Line; do
								[ "${Line[0]}" == '??' ] && let NFTTL++
							done <<< "$(git status --short)"
							printf -v NFTTL "%'d" $NFTTL

							Desc="${C_BCyan}${GI[3]}  ${C_Grey}Branch '${GB:-?}' has $NFTTL new file(s)."
							break
						elif [ "${Line[0]}" == 'deleted:' ]; then
							Desc="${C_BCyan}${GI[9]}  ${C_Grey}Branch '${GB:-?}' detects removed file(s)."
							break
						elif [ "${Line[0]}" == 'modified:' ]; then
							readarray Buffer <<< "$(git --no-pager diff --name-only)"
							printf -v ModifiedFiles "%'d" ${#Buffer[@]}
							Desc="${C_BCyan}${GI[2]}  ${C_Grey}Branch '${GB:-?}' has $ModifiedFiles modified file(s)."
							break
						elif [ "${Line[0]}${Line[1]}${Line[2]}${Line[3]}" == 'Changestobecommitted:' ]; then
							Desc="${C_BCyan}${GI[1]}  ${C_Grey}Branch '${GB:-?}' has changes to commit."
							break
						elif [ "${Line[0]}${Line[1]}${Line[3]}" == 'Yourbranchahead' ]; then
							printf -v TTLCommits "%'d" "${Line[7]}"
							Desc="${C_BCyan}${GI[6]}  ${C_Grey}Branch '${GB:-?}' leads by $TTLCommits commit(s)."
							break
						elif [ "${Line[0]}${Line[1]}${Line[2]}" == 'nothingtocommit,' ]; then
							printf -v TTLCommits "%'d" "$(git rev-list --count HEAD)"

							Desc="${C_BCyan}${GI[0]}  ${C_Grey}Branch '${GB:-?}' is $TTLCommits commit(s) clean."
							break
						fi
					done <<< "$Status"
				fi
			fi
		fi

		#PS1="\[${C_Reset}\]╭──╼${X}╾──☉  ${Desc}\[${C_Reset}\]\n╰─☉  "

		# 2021-06-13: Temporary block — just experimenting.
		if [ -n "$Desc" ]; then
			if [ -n "$X" ]; then
				PS1="\[${C_Reset}\]${Desc}\[${C_Reset}\]\n\[\e[91m\]${X} \[\e[0m\]\[\e[3;2;37m\]➙ \[\e[0m\] "
			else
				PS1="\[${C_Reset}\]${Desc}\[${C_Reset}\]\n\[\e[3;2;37m\]➙ \[\e[0m\] "
			fi
		else
			if [ -n "$X" ]; then
				PS1="\[${C_Reset}\]\[\e[91m\]${X} \[\e[0m\]\[\e[3;2;37m\]➙ \[\e[0m\] "
			else
				PS1="\[${C_Reset}\]\[\e[2;37m\]➙ \[\e[0m\] "
			fi
		fi

		unset Z Line Desc GI Status Top X GB CWD\
			Buffer ModifiedFiles TTLCommits NFTTL
	fi
}

PROMPT_COMMAND='PROMPT_PARSER $?'
