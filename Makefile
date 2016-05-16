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
	#nvim +GoInstallBinaries

nvim-clean:
	rm -rf ~/.config/nvim || echo "DNE"
	rm -rf ~/.vim || echo "DNE"
	rm ~/.vimrc || echo "DNE"
	rm -rf $GOPATH/src/github.com/jstemmer/gotags || echo "DNE"
	brew uninstall ctags || echo "DNE"
