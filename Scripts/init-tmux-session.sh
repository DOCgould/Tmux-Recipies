#!/bin/bash
#***********************************************
#
#      Filename: /home/cgould/Templates/workflow/workflow-tmux/init-session-tmux.sh
#
#        Author: CGOULD - cgould@sdsu.edu
#   Description: ---
#        Create: 2022-02-28 18:43:43
# Last Modified: 2022-02-28 18:43:43
#***********************************************
function OpenSessionTrio()
{
    # a simple example - not using pane numbering
    tmux split-window -h \;\
        split-window -v
}

function OpenSessionQuad()
{

    #  _____
    # |__|__|
    # |__|__|
    #
    # A simple example using the "active pane"
    tmux split-window -p 66 \;\
         split-window -d \;\
         split-window -h
}

function OpenSessionEnth()
{
    #  _____
    # |__ __|
    # |__|__|
    # |_____|
    #
    # A simple example using pane numbering
    tmux split-window -v -p 75 \; \
        split-window -h -p 30 \; \
        select-pane -t 1 \; \
        split-window -v \; \
        send-keys 'systemctl status' C-m\;
}

# Set Session Name
SESSION="[GENERIC-SESSION]"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Window Corresponding to Our Session
    tmux rename-window -t $SESSION:1 '[GENERAL]'

    # Open Quad Panes ( expects window to be open )
    OpenSessionQuad

    # Create a New Window Named [Writing]
    tmux new-window -t $SESSION:2 -n '[CONFIG]'
    OpenSessionEnth


    # Setup an additional Shell for Misc
    tmux new-window -t $SESSION:3 -n '[MISC]'
    OpenSessionTrio
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:1
