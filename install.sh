#!/bin/bash

CURR_PATH=$(
	cd $(dirname $0)
	pwd -P
)

ln -sf ${CURR_PATH}/.tmux/ ~
ln -sf ${CURR_PATH}/.tmux/.tmux.conf ~
ln -sf ${CURR_PATH}/.tmux.conf.local ~
ln -sf ${CURR_PATH}/.zshrc ~
ln -sf ${CURR_PATH}/.bashrc ~
ln -sf ${CURR_PATH}/nvim ~/.config/nvim
