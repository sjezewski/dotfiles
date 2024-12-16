" Other source to look into: https://github.com/spf13/spf13-vim

set nocompatible               " be iMproved
filetype off                   " required

set clipboard=unnamed

" https://github.com/ngmy/vim-rubocop
let g:vimrubocop_config = '$HOME/.dotfiles/vim/rubocop.yml'
" https://serverfault.com/questions/157879/vim-trigger-action-script-on-save-write
" too many errors on callerzen to do this on save
":autocmd BufWritePost *.rb Rubocop <afile>
":autocmd BufWritePost *.rb Rubocop %p


" Prob set filter to suffix w go
"autocmd BufWritePost * execute '!$HOME/dotfiles/scripts/dm-rsync.sh'

" Golang specific helpers
" :so golang.vim
" map <C-0> :GoImport


set nocompatible
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"
"" Add plugins here
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'johnsyweb/vim-makeshift.git'
"Bundle 'mattn/emmet-vim'
"Plugin 'mileszs/ack.vim'
"Bundle 'scrooloose/syntastic'
"Bundle 'Shougo/neocomplete.vim'
"Bundle 'majutsushi/tagbar'
"" non github repos
"Bundle 'fatih/vim-go'
"
"call vundle#end()
filetype plugin indent on

" couldnt get fzf working w vundle ... trying vim-plug instead
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ngmy/vim-rubocop'
call plug#end()

" aliases for fzf
":Files (PWD)
":Buffers
":Lines "in loaded buffers
":BLines "in current buffer
":Ag "search withing files

"noremap ,
:nmap <C-f> :Files  .<CR>
:nmap <C-b> :Buffers<CR>
:nmap <C-l> :Lines<CR>
:nmap <C-bl> :BLines<CR>
:nmap <C-x> :Ag<CR>

":nmap <C-x> :Ag --ignore={'*node_modules', '*site-packages'}<CR>


colors pablo
let mapleader = ","
set nu!
set cin!
set shiftwidth=4
set tabstop=4
set expandtab
syn on
set tags+=.tags
set viminfo='100,f1
set hlsearch
set backspace=indent,eol,start
noremap <silent> <Space> :nohlsearch<Bar> :echo<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
let @a='ds('
set switchbuf=usetab

au FileType make setl noet



"noremap <leader>f :let @"=@%<CR>

"let g:fuf_modesDisable = []
"let g:fuf_mrufile_maxItem = 400
"let g:fuf_mrucmd_maxItem = 400
"nnoremap <silent> <special> <C-\>b     :FufBuffer<CR>
"nnoremap <silent> <special> <C-\>f     :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> <special> <C-\>F     :FufFileWithFullCwd<CR>
"nnoremap <silent> <special> <C-\><C-f> :FufFile<CR>
"nnoremap <silent> <special> <C-\>v     :FufCoverageFile<CR>
"nnoremap <silent> <special> <C-\>l     :FufCoverageFileChange<CR>
"nnoremap <silent> <special> <C-\>L     :FufCoverageFileChange<CR>
"nnoremap <silent> <special> <C-\><C-l> :FufCoverageFileRegister<CR>
"nnoremap <silent> <special> <C-\>d     :FufDirWithCurrentBufferDir<CR>
"nnoremap <silent> <special> <C-\>D     :FufDirWithFullCwd<CR>
"nnoremap <silent> <special> <C-\><C-d> :FufDir<CR>
"nnoremap <silent> <special> <C-\>n     :FufMruFile<CR>
"nnoremap <silent> <special> <C-\>N     :FufMruFileInCwd<CR>
"nnoremap <silent> <special> <C-\>m     :FufMruCmd<CR>
"nnoremap <silent> <special> <C-\>u     :FufBookmarkFile<CR>
"nnoremap <silent> <special> <C-\><C-u> :FufBookmarkFileAdd<CR>
"vnoremap <silent> <special> <C-\><C-u> :FufBookmarkFileAddAsSelectedText<CR>
"nnoremap <silent> <special> <C-\>i     :FufBookmarkDir<CR>
"nnoremap <silent> <special> <C-\><C-i> :FufBookmarkDirAdd<CR>
"nnoremap <silent> <special> <C-\>t     :FufTag!<CR>
"nnoremap <silent> <special> <C-\>T     :FufTag<CR>
"nnoremap <silent> <special> <C-\><C-]> :FufTagWithCursorWord!<CR>
"nnoremap <silent> <special> <C-\>,     :FufBufferTag!<CR>
"nnoremap <silent> <special> <C-\><     :FufBufferTag<CR>
"vnoremap <silent> <special> <C-\>,     :FufBufferTagWithSelectedText!<CR>
"vnoremap <silent> <special> <C-\><     :FufBufferTagWithSelectedText<CR>
"nnoremap <silent> <special> <C-\>}     :FufBufferTagWithCursorWord!<CR>
"nnoremap <silent> <special> <C-\>.     :FufBufferTagAll<CR>
"nnoremap <silent> <special> <C-\>>     :FufBufferTagAll!<CR>
"vnoremap <silent> <special> <C-\>.     :FufBufferTagAllWithSelectedText!<CR>
"vnoremap <silent> <special> <C-\>>     :FufBufferTagAllWithSelectedText<CR>
"nnoremap <silent> <special> <C-\>]     :FufBufferTagAllWithCursorWord!<CR>
"nnoremap <silent> <special> <C-\>g     :FufTaggedFile<CR>
"nnoremap <silent> <special> <C-\>G     :FufTaggedFile!<CR>
"nnoremap <silent> <special> <C-\>o     :FufJumpList<CR>
"nnoremap <silent> <special> <C-\>c     :FufChangeList<CR>
"nnoremap <silent> <special> <C-\>q     :FufQuickfix<CR>
"nnoremap <silent> <special> <C-\>y     :FufLine<CR>
"nnoremap <silent> <special> <C-\>h     :FufHelp<CR>
"nnoremap <silent> <special> <C-\>e     :FufEditDataFile<CR>
"nnoremap <silent> <special> <C-\>r     :FufRenewCache<CR>




