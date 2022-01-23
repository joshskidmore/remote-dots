#####################################################################
# tmux < 2.9                                                        #
#####################################################################

# status bar
set -g status "on"
set -g status-attr "none"
set -g status-justify "left"
set -g status-bg "colour237"

# status left
set -g status-left-attr "none"
set -g status-left-length "0"
set -g status-left ""

# status right
set -g status-right-attr "none"
set -g status-right-length "100"
# set -g status-right "#[fg=colour15]#{=-50:pane_title} #[fg=colour237,bg=colour208,bold]#{?client_prefix, CMD ,}#{?window_zoomed_flag, ZOOM ,}#{?session_many_attached, MULTI ,}#{?window_bell_flag, BELL ,}#[bg=colour237] #[fg=colour15,bg=colour197,bold] %Y-%m-%d | %I:%M "
set -g status-right "#[fg=colour15]#{=-50:pane_title} #[fg=colour237,bg=colour208,bold]#{?client_prefix, CMD ,}#{?window_zoomed_flag, ZOOM ,}#{?session_many_attached, MULTI ,}#{?window_bell_flag, BELL ,}#[bg=colour237] #[fg=colour15,bg=colour197,bold] %m/%e %l:%M "

# window
setw -g window-status-attr "none"
setw -g window-status-separator ""
setw -g window-status-format "#[fg=colour7,bg=colour237] #I #[fg=colour7,bg=colour237]#W "

# active window
setw -g window-status-activity-attr "none"
setw -g window-status-current-format "#[fg=colour237,bg=colour226] #I #[fg=colour237,bg=colour226]#W "

# panes
set -g pane-active-border-fg "colour248"
set -g pane-border-fg "colour238"

# command bar
set -g message-command-fg "colour237"
set -g message-command-bg "colour248"
set -g message-fg "colour237"
set -g message-bg "colour248"
