#####################################################################
# tmux >= 2.9                                                       #
#####################################################################

# status bar
set -g status "on"
set -g status-justify "left"
set -g status-style "none",bg="colour237"

# status left
set -g status-left-style "none"
set -g status-left-length "0"
set -g status-left ""

# status right
set -g status-right-style "none"
set -g status-right-length "100"
#set -g status-right "#[fg=colour15]#{=-50:pane_title} #[fg=colour237,bg=colour208,bold]#{?client_prefix, CMD ,}#{?window_zoomed_flag, ZOOM ,}#{?session_many_attached, MULTI ,}#{?window_bell_flag, BELL ,}#[bg=colour237] #[fg=colour15,bg=colour197,bold] %Y-%m-%d | %I:%M "
set -g status-right "#[fg=colour15]#{=-50:pane_title} #[fg=colour237,bg=colour208,bold]#{?client_prefix, C ,}#{?window_zoomed_flag, Z ,}#{?session_many_attached, M ,}#{?window_bell_flag, B ,}#[bg=colour237] #[fg=colour15,bg=colour197,bold] %m/%e %I:%M "

# window
setw -g window-status-style "none"
setw -g window-status-separator ""
setw -g window-status-format "#[fg=colour7,bg=colour237] #I #[fg=colour7,bg=colour237]#W "

# active window
setw -g window-status-activity-style "none"
setw -g window-status-current-format "#[fg=colour237,bg=colour226] #I #[fg=colour237,bg=colour226]#W "

# panes
set -g pane-active-border-style fg="colour248"
set -g pane-border-style fg="colour238"

# command bar
set -g message-command-style fg="colour237",bg="colour248"
set -g message-style fg="colour237",bg="colour248"
