#!/bin.bash

cd && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .

# Keep in mind that some of the binding is different.
# However Ctrl + b and Ctrl + a are interchangeable in this setting
