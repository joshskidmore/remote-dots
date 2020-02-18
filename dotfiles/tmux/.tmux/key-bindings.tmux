#####################################################################
# key bindings                                                      #
#####################################################################

# determine prefix (direct = ctrl-a / ssh = ctrl-b)
run $TMUX_DIR/leader-bind.sh

# search: prefix + /
bind-key / copy-mode \; send-key ?

# reload/re-source ~/.tmux.conf
bind r source-file ~/.tmux.conf\; display "~/.tmux.conf reloaded"

# make previous/next window repeatable
unbind-key n
unbind-key p
bind -r n next-window
bind -r p previous-window

# x to (quietly) quit pane
unbind-key x
bind-key x kill-pane

# X to quit window
bind-key X kill-window

# last window: leader + ctrl-spc
bind C-Space last-window
