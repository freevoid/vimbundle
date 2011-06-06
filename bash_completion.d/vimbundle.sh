_vimbundle ()
{
	local cur prev opts lopts cmds prfls

	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	opts="-c -h"
	lopts="--help --config --vimdir --list-commands"
    cmds="`vimbundle --list-commands`"
	case "${cur}" in
		--*)
			COMPREPLY=( $( compgen -W "${lopts}" -- $cur ) )
			return 0
	            	;;
	        -*)
			COMPREPLY=( $( compgen -W "${opts} ${lopts}" -- $cur ) )
	        	return 0
       			;;
       		*)
			if [ $COMP_CWORD -eq 1 ]; then
				COMPREPLY=( $( compgen -W "${opts} ${lopts} ${cmds}" -- $cur ) )
        		fi
			;;
    	esac

    case "${prev}" in
        disable)
            benabled="`ls $HOME/.vim/bundle-enabled`"
            COMPREPLY=( $(compgen -W "${benabled}" -- $cur) )
        ;;
        enable)
            bavailable="`ls $HOME/.vim/bundle-available`"
            COMPREPLY=( $(compgen -W "${bavailable}" -- $cur) )
        ;;
    esac

    return 0
}

complete -F _vimbundle vimbundle
