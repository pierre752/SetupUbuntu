#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

export PATH_TO_FILE="`dirname \"$0\"`"

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
# curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
# source $HOME/.nvm/nvm.sh
# nvm install v0.10.12
# nvm use v0.10.12

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
# sudo apt-get install -y rlwrap

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
# wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh



#Config settings for GIT
# Git
if which git > /dev/null; then
	ln -sb ${PATH_TO_FILE}/Ubuntudotfiles/git/gitconfig ~/.gitconfig
	ln -sb ./Ubuntudotfiles/git/gitignore_global ~/.gitignore
	# Download auto completion
	curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
	if [ -d ./Ubuntudotfiles ]
		then
			cd Ubuntudotfiles/;
			git pull;
			cd ..
		else
			git clone https://github.com/pierre752/Ubuntudotfiles.git
	fi

# s is for symboic link and b is for backup
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_prorfile ~/
ln -sb dotfiles/.bashrc ~/
ln -sb dotfiles/.bashrc_custom ~/
else
	echo "${RED}Attention: ${DEFAULT} Git not found"
fi
echo "All links made correctly for a $KERNEL operating system, if there is an error, please report to pierre752@gmail.com"
