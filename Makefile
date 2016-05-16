all:
	ln zsh/.zshrc ~/.zshrc
	ln git/.gitconfig ~/.gitconfig
	ln tmux/.tmux.conf ~/.tmux.conf

nvim:
	mkdir -p ~/.config
	mkdir -p ~/.vim/bundle
	mkdir -p ~/.vim

	# Hook dotfile -> vim -> nvim
	ln -s ~/.vim ~/.config/nvim
	ln -s vim/.vimrc ~/.vimrc
	ln -s ~/.vimrc ~/.config/nvim/init.vim
#	ln -s ~/.vimrc ~/.vim/init.vim

	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	nvim +BundleInstall +qall
	# To get the go parser:
	go get -u github.com/jstemmer/gotags
	brew install ctags

nvim-clean:
	rm -rf ~/.config/nvim || echo "DNE"
	rm -rf ~/.vim || echo "DNE"
	rm ~/.vimrc || echo "DNE"
	rm -rf $GOPATH/src/github.com/jstemmer/gotags || echo "DNE"
	brew uninstall ctags || echo "DNE"
