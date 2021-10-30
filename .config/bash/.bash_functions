source_if_exists(){
	[ -f "$1" ] && source "$1" && echo "Sourcing \"$1\""
}
