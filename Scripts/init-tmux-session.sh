#***********************************************
#
#      Filename: init-tmux-session.sh
#
#        Author: CGOULD - cgould@sdsu.edu
#   Description: ---
#        Create: 2022-04-12 11:44:54
# Last Modified: 2022-04-12 11:44:54
#***********************************************
function OpenSessionTrio()
{
    tmux new-session \;\
        split-window -h \;\
        split-window -v \;\
        attach
}

function OpenSessionQuad()
{

    #  _____
    # |__|__|
    # |__|__|
    #
    tmux new-session \;\
        split-window -p 66 \;\
        split-window -d \;\
        split-window -h
}

function OpenSessionEnth()
{
    #  _____
    # |__|__|
    # |__|__|
    #
    tmux new-session \; \
        send-keys 'tail -f /var/log/monitor.log' C-m \; \
        split-window -v -p 75 \; \
        split-window -h -p 30 \; \
        send-keys 'neofetch' C-m \; \
        select-pane -t 1 \; \
        split-window -v \; \
        send-keys 'htop' C-m \;
}

#OpenSessionTrio
#OpenSessionQuad
#OpenSessionEnth
