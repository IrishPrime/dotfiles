bind \el 'echo; __fish_list_current_token; echo'
bind \ew 'set tok (commandline -pt); if test $tok[1]; echo; whatis $tok[1]; commandline -f repaint; end; echo'
