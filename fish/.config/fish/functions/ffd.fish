function ffd --wraps='aerospace list-windows --all | fzf --bind \'enter:execute(bash -c "aerospace focus --window-id {1}")+abort\'; exit' --description 'alias ffd=aerospace list-windows --all | fzf --bind \'enter:execute(bash -c "aerospace focus --window-id {1}")+abort\'; exit'
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'; exit $argv
        
end
