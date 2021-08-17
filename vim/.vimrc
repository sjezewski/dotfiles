" Other source to look into: https://github.com/spf13/spf13-vim

set nocompatible               " be iMproved
filetype off                   " required

set clipboard=unnamed

" Prob set filter to suffix w go
"autocmd BufWritePost * execute '!$HOME/dotfiles/scripts/dm-rsync.sh'

map <C-K> :!$HOME/dotfiles/scripts/dm-rsync.sh $DOCKER_MACHINE_NAME
map <C-0> :GoImport

" Golang specific helpers
:so golang.vim


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'johnsyweb/vim-makeshift.git'
Bundle 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplete.vim'
Bundle 'majutsushi/tagbar'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'fatih/vim-go'
" ...
"
call vundle#end()            " required
filetype plugin indent on    " required!

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

"set nocp
"filetype plugin on


hi ShowMarksHLl guifg=red guibg=green
hi ShowMarksHLu guifg=red guibg=green
hi ShowMarksHLo guifg=red guibg=green
hi ShowMarksHLm guifg=red guibg=green

noremap <C-b> :TlistToggle<CR>

:ab #i #include
:ab #d #define
:ab consterator const_iterator


" PROBLEM BELOW HERE
"noremap <leader>f :let @"=@%<CR>
"
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


"" RSI (stands for "retained surgical instruments")
"au FileType cpp,c syn keyword cTodo RSI
"com RSI grep '\<RSI\>' **/*
"
"match Todo /\s\+$/

"syntax match cpp 'std_contains' conceal cchar=∋
"
"func! WordProcessorMode()
"  setlocal formatoptions=t1
"  setlocal textwidth=80
"  map j gj
"  map k gk
"  setlocal smartindent
"  setlocal spell spelllang=en_us
"  setlocal noexpandtab
"endfu
"com! WP call WordProcessorMode()
"
"set ruler
"au BufRead,BufNewFile *.elm set filetype=elm
"
"let g:haddock_browser="/usr/bin/lynx"
"
"set rtp+=$GOROOT/misc/vim
"filetype plugin indent on
"syntax on
"
" last change VV
"
"au FileType go nmap <leader>t <Plug>(go-test)
"
"
"let g:tagbar_type_go = {  
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"        \ 'p:package',
"        \ 'i:imports:1',
"        \ 'c:constants',
"        \ 'v:variables',
"        \ 't:types',
"        \ 'n:interfaces',
"        \ 'w:fields',
"        \ 'e:embedded',
"        \ 'm:methods',
"        \ 'r:constructor',
"        \ 'f:functions'
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"        \ 't' : 'ctype',
"        \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"        \ 'ctype' : 't',
"        \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"\ }

" latest change VV
"nmap <M-CR> :TagbarToggle<CR>
"
"" neocomplete needs lua, which needs vim > 7.3.5, and neovim doesnt support lua yet
"" let g:neocomplete#enable_at_startup = 1
"
"map <C><CR> :w<CR>
"
"map <C-[> :tabp
"map <C-]> :tabn
"
"set ic

colorscheme desert
