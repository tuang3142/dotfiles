# This tmux statusbar config was created by tmuxline.vim
# on Wed, 18 Aug 2021

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#1d2021,bg=#7c6f64"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#fe8019"
set -g status-style "none,bg=#3c3836"
set -g message-style "fg=#1d2021,bg=#7c6f64"
set -g pane-border-style "fg=#7c6f64"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#a89984,bg=#3c3836"
set -g status-left "#[fg=#1d2021,bg=#fe8019,bold] #S #[fg=#fe8019,bg=#3c3836,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#7c6f64,bg=#3c3836,nobold,nounderscore,noitalics]#[fg=#1d2021,bg=#7c6f64] %Y-%m-%d  %H:%M #[fg=#fe8019,bg=#7c6f64,nobold,nounderscore,noitalics]#[fg=#1d2021,bg=#fe8019] #h "
setw -g window-status-format "#[fg=#a89984,bg=#3c3836] #I #[fg=#a89984,bg=#3c3836] #W "
setw -g window-status-current-format "#[fg=#3c3836,bg=#7c6f64,nobold,nounderscore,noitalics]#[fg=#1d2021,bg=#7c6f64] #I #[fg=#1d2021,bg=#7c6f64] #W #[fg=#7c6f64,bg=#3c3836,nobold,nounderscore,noitalics]"
