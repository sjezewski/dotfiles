GCLOUD_PKG = google-cloud-sdk-110.0.0-linux-x86_64
SHELL := /bin/bash

all:
	ln zsh/.zshrc ~/.zshrc
	ln git/.gitconfig ~/.gitconfig
	ln tmux/.tmux.conf ~/.tmux.conf

nvim:
	# Need vim > 7.3.5 w lua to use neocomplete
	brew install vim --with-lua
	# lua not supported yet in neovim

	# Setup config folders / vundler
	mkdir -p ~/.config
	mkdir -p ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	# To get the go parser:
	go get -u github.com/jstemmer/gotags
	brew install ctags

	# Setup nvim directory
	ln -s ~/.vim ~/.config/nvim

	# Hook dotfile -> vim -> nvim
	ln -s $(PWD)/vim/.vimrc ~/.vimrc
	ln -s ~/.vimrc ~/.config/nvim/init.vim

	nvim +BundleInstall +qall
	# To get the go parser:
	go get -u github.com/jstemmer/gotags
	# brew install ctags # This should be redundant bcz of line above

nvim-clean:
	rm -rf ~/.config/nvim || echo "DNE"
	rm -rf ~/.vim || echo "DNE"
	rm ~/.vimrc || echo "DNE"
	rm -rf $GOPATH/src/github.com/jstemmer/gotags || echo "DNE"
	brew uninstall ctags || echo "DNE"

docker-machine:
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get -y upgrade
	sudo apt-get install neovim
	sudo curl -O https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
	sudo tar -xvf go1.7.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go
	sudo mv go /usr/local
	mkdir -p $$HOME/go
	sudo curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > dm
	sudo mv dm /usr/local/bin/docker-machine
	sudo chmod +x /usr/local/bin/docker-machine
	sudo usermod -aG docker `whoami`
	sudo chown docker-user /etc/fuse.conf
	sudo echo 'user_allow_other' >> /etc/fuse.conf
	@# Upgrade file limits - needed for pfs server tests
	sudo chown docker-user /etc/security/limits.conf
	sudo echo '* soft nofile 20100' >> /etc/security/limits.conf
	sudo echo '* hard nofile 20100' >> /etc/security/limits.conf
	sudo chown docker-user /etc/pam.d/common-session
	sudo chown docker-user /etc/pam.d/common-session-noninteractive
	sudo echo 'session required pam_limits.so' >> /etc/pam.d/common-session
	sudo echo 'session required pam_limits.so' >> /etc/pam.d/common-session-noninteractive
	sudo apt-get install python-pip
	@# Install s3cmd for pachyderm www site deployment
	sudo apt-get -y install python-setuptools
	wget http://netix.dl.sourceforge.net/project/s3tools/s3cmd/1.6.0/s3cmd-1.6.0.tar.gz
	tar xvfz s3cmd-1.6.0.tar.gz
	cd s3cmd-1.6.0 && sudo python setup.py install

pachyderm-linux:
	wget https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/linux/amd64/kubectl
	chmod +x kubectl
	sudo chown docker-user /usr/local/bin
	mv kubectl /usr/local/bin/
	sudo apt-get install gcc

pachyderm-mac:
	wget https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/darwin/amd64/kubectl
	chmod +x kubectl
	mv kubectl /usr/local/bin

docker:
	sudo apt-get update
	sudo apt-get install docker-engine
	sudo docker run hello-world

gcloud:
	wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$(GCLOUD_PKG).tar.gz
	sudo tar -xvf $(GCLOUD_PKG).tar.gz
	sudo /google_cloud_sdk/install.sh
	source $$HOME/.bash_profile
	sudo gcloud init

install-shell:
	@rm ~/.bash_profile || true
	@echo "source $$HOME/dotfiles/profile/.profile" >> ~/.bash_profile
	@if [ $$(uname -a | cut -f 1 -d " ") == "Darwin" ]; then \
		echo "source $$HOME/dotfiles/profile/.osx.sh" >> ~/.bash_profile; \
	else \
		echo "source $$HOME/dotfiles/profile/.linux.sh" >> ~/.bash_profile; \
	fi
	@if [ $$(which rvm) -eq 0 ]; then\
		echo "source $(HOME)/.rvm/scripts/rvm" >> ~/.bash_profile; \
	fi
	rm -rf ext_scripts || true
	mkdir ext_scripts
	cd ext_scripts && git clone git@github.com:sjezewski/context
	source $$HOME/.bash_profile

osx-client: install-shell
	brew install ssh-copy-id
	ssh-copy-id -o BatchMode=yes -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=no -o ControlPath=none -o IdentitiesOnly=yes -i /Users/sjezewski/.docker/machine/machines/$(DOCKER_MACHINE_NAME)/id_rsa.pub -p 22 $(docker-machine ip $DOCKER_MACHINE_NAME)
	bash -i -c "source $$HOME/.bash_profile && sync_docker_machine $$DOCKER_MACHINE_NAME $$HOME/.docker $$DOCKER_MACHINE_HOME/"

.PHONY: docker-machine pachyderm
