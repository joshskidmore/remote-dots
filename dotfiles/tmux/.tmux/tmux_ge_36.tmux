#####################################################################
# tmux >= 3.6                                                       #
# light/dark theme follows the attached client's terminal           #
#####################################################################

# colors come from @vars set by theme-dark/theme-light
set -g status-right "#[fg=#{@bar_fg}]#{=-50:pane_title} #[fg=#222222,bg=colour208,bold]#{?client_prefix, C ,}#{?window_zoomed_flag, Z ,}#{?session_many_attached, M ,}#{?window_bell_flag, B ,}#[bg=#{@bar_bg}] #[fg=#ffffff,bg=colour197,bold] %m/%e %I:%M "
setw -g window-status-format "#[fg=#{@inact_fg},bg=#{@inact_bg}] #I #[fg=#{@inact_fg},bg=#{@inact_bg}]#W "
setw -g window-status-current-format "#[fg=#{@tab_fg},bg=#{@tab_bg}] #I #[fg=#{@tab_fg},bg=#{@tab_bg}]#W "

# on reload the attached client's theme decides; dark with no client
if-shell -F '#{==:#{client_theme},light}' 'source-file ~/.tmux/theme-light.tmux' 'source-file ~/.tmux/theme-dark.tmux'
set-hook -g client-attached "if-shell -F '#{==:#{client_theme},light}' 'source-file ~/.tmux/theme-light.tmux ; refresh-client -S' 'source-file ~/.tmux/theme-dark.tmux ; refresh-client -S'"
set-hook -g client-dark-theme 'source-file ~/.tmux/theme-dark.tmux ; refresh-client -S'
set-hook -g client-light-theme 'source-file ~/.tmux/theme-light.tmux ; refresh-client -S'
