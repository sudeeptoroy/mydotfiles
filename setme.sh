#/bin/bash

S_PWD=`pwd`
echo "PWD = $S_PWD"

echo "this script is going to overwrite .vim/.screenrc/.tmux.conf append .bashrc, press ctrl+c to quit, else continue by pressing enter"
read junk

echo ". $S_PWD/git-prompt.sh " >> ~/.bashrc
echo ". $S_PWD/bashrc.1" >> ~/.bashrc
echo ". $S_PWD/aliases" >> ~/.bashrc

ln -s $S_PWD/screenrc ~/.screenrc

ln -s $S_PWD/tmux ~/.tmux
ln -s $S_PWD/tmux.conf ~/.tmux.conf

ln -s $S_PWD/vim ~/.vim
ln -s $S_PWD/vimrc ~/.vimrc

