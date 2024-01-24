function _cmux()
{
  latest="${COMP_WORDS[$COMP_CWORD]}"
  prev="${COMP_WORDS[$COMP_CWORD - 1]}"
  words=""

  case "${prev}" in
    cmux)
      words="   main
                python
                "
      ;;
   *)
      ;;
  esac
  COMPREPLY=($(compgen -W "$words" -- $latest))
  return 0
}

cmux_main() {
    if command -v tmux &> /dev/null; then
        local session_name="Main"

        # Check if the session already exists
        if tmux has-session -t $session_name &> /dev/null; then
            echo "Session '$session_name' already exists. Attaching to it."
            tmux attach-session -t $session_name
        else
            # Create a new tmux session named 'Home' with 'Main' and 'Doc' windows
            tmux new-session -d -s $session_name -n Main
            tmux new-window -t $session_name: -n Doc

            # Attach to the 'Home' session
            tmux select-window -t $session_name:Main
            tmux attach-session -t $session_name
        fi
    else
        echo "tmux is not installed. Please install tmux and try again."
    fi
}
cmux_python() {
    if command -v tmux &> /dev/null; then
        local session_name="Python"

        # Check if the session already exists
        if tmux has-session -t $session_name &> /dev/null; then
            echo "Session '$session_name' already exists. Attaching to it."
            tmux attach-session -t $session_name
        else
            # Create a new tmux session named 'Home' with 'Main' and 'Doc' windows
            tmux new-session -d -s $session_name -n Term
            tmux new-window -t $session_name: -n Nvim

            # Attach to the 'Home' session
            tmux select-window -t $session_name:Main
            tmux attach-session -t $session_name
        fi
    else
        echo "tmux is not installed. Please install tmux and try again."
    fi

    echo "Done"
}

fuction cmux() 
{
    case "$1" in
        "main")
            cmux_main()
            return 0
            ;;

        "python")
            cmux_python()
            return 0
            ;;
        *)
            ;;
    esac
    return 0
}
complete -F _cmux cmux

