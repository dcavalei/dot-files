extract () {
	local src=$1 
	local dst=${2:-$PWD} 
	if [ -f $src ]
	then
		[ ! -d $dst ] && mkdir $dst && warn_msg "Folder $dst was created."
		pushd $dst > /dev/null
		local start_time=$(date +%s) 
		case $1 in
			(*.tar.bz2) [ -n "`which pv`" ] && pv $1 | tar -xvjf - > /dev/null || tar xvjf $1 ;;
			(*.tar.gz) [ -n "`which pv`" ] && pv $1 | tar -xvzf - > /dev/null || tar xvzf $1 ;;
			(*.tar.xz) [ -n "`which pv`" ] && pv $1 | tar -xJ || tar -xJf $1 ;;
			(*.bz2) bunzip2 $1 ;;
			(*.rar) unrar x $1 ;;
			(*.gz) gunzip $1 ;;
			(*.tar) tar xvf $1 ;;
			(*.tbz2) tar xvjf $1 ;;
			(*.tgz) tar xvzf $1 ;;
			(*.zip) unzip $1 ;;
			(*.Z) uncompress $1 ;;
			(*.7z) 7z x $1 ;;
			(*) echo "don't know how to extract '$1'..." ;;
		esac
		local end_time=$(date +%s) 
		[ -z "`which pv`" ] && echo "Time taken: $(date -ud "@$((end_time-start_time))" +'%H:%M:%S')"
		popd > /dev/null
	else
		echo "'$1' is not a valid file!"
	fi
}
