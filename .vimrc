set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin manager
Plugin 'VundleVim/Vundle.vim'
" Snippets and completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'

Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

Plugin 'jiangmiao/auto-pairs'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'

Plugin 'lervag/vimtex'
Plugin 'nvie/vim-flake8'
Plugin 'plasticboy/vim-markdown'
call vundle#end()

set encoding=utf-8
set number relativenumber

" YouCompleteMe Keybindings
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-tab>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:tex_flavor = "latex"

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python' : ['black', 'autopep8'],
\}

let g:ale_python_flake8_options = '--ignore=E501,E265,E302,E303'

nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTree<CR>
nnoremap <F5> :UndotreeToggle<CR>

filetype plugin on
filetype indent on
" autocmd vimenter * NERDTree

packloadall
silent! helptags ALL
