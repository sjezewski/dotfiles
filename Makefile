GCLOUD_PKG = google-cloud-sdk-110.0.0-linux-x86_64

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
	sudo curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
	sudo tar -xvf go1.6.linux-amd64.tar.gz
	sudo mv go /usr/local
	cp docker-machine/.profile $$HOME/.bash_profile

pachyderm:
	wget https://storage.googleapis.com/kubernetes-release/release/v1.2.2/bin/linux/amd64/kubectl
	chmod +x kubectl
	mv kubectl /usr/local/bin/
	sudo apt-get install gcc

docker:
	sudo apt-get update
	sudo apt-get install docker-engine
	sudo docker run hello-world

gcloud:
	wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$(GCLOUD_PKG).tar.gz
	sudo tar -xvf $(GCLOUD_PKG).tar.gz
	sudo /google_cloud_sdk/install.sh
	source $HOME/.bash_profile
	sudo gcloud init

osx: osx-install-syncer osx-sync

osx-install-syncer:
	# Setup docker rsync
	brew tap synack/docker
	brew install docker-rsync

osx-sync:
	# Go to pachyderm repo and sync
	cd $$GOPATH/src/github.com/pachyderm/pachyderm
	echo ".git" >> .rsyncignore
	docker-rsync dev

.PHONY: docker-machine pachyderm
