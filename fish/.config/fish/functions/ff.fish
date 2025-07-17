function ff --wraps='aerospace list-windows --all | fzf --bind \'enter:execute(bash -c "aerospace focus --window-id {1}")+abort\'' --description 'alias ff=aerospace list-windows --all | fzf --bind \'enter:execute(bash -c "aerospace focus --window-id {1}")+abort\''
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort' $argv
        
end
