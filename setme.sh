#/bin/bash

S_PWD=`pwd`

echo "PWD = $S_PWD"


echo "this script is going to overwrite .vim/.screenrc/.tmux.conf"

echo ". $S_PWD/bashrc.1" >> ~/.bashrc

ln -s $S_PWD/aliases ~/.aliases

ln -s $S_PWD/screenrc ~/.screenrc

ln -s $S_PWD/tmux ~/.tmux
ln -s $S_PWD/tmux.conf ~/.tmux.conf

ln -s $S_PWD/vim ~/.vim
ln -s $S_PWD/vimrc ~/.vimrc

