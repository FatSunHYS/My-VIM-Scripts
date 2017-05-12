#!/bin/bash

set -e
set -x

rm -rf ~/.vimrc
rm -rf ~/.vim

sudo pacman -Sy --needed git clang cscope boost cmake wget python-markdown python2-markdown python-pygments python2-pygments python-jedi python2-jedi


cp ./vimrc ~/.vimrc
mkdir -p ~/.vim/bundle


# Install the Vundle Plugin
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cat >> ~/.vimrc << EOF
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

EOF


# Install the auto-pairs
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

sed -i "/call vundle\#end()/i\Plugin \'jiangmiao\/auto-pairs\'" ~/.vimrc


# Install the nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

sed -i "/call vundle\#end()/i\Plugin \'scrooloose\/nerdtree\'" ~/.vimrc

cat >> ~/.vimrc << EOF
map <C-n> :NERDTreeToggle<CR>

EOF


# Install the tagbar
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar

sed -i "/call vundle\#end()/i\Plugin \'majutsushi\/tagbar\'" ~/.vimrc

cat >> ~/.vimrc << EOF
nmap <F8> :TagbarToggle<CR>

EOF


# Install the vim-autoformat
git clone https://github.com/Chiel92/vim-autoformat.git ~/.vim/bundle/vim-autoformat

sed -i "/call vundle\#end()/i\Plugin \'Chiel92\/vim-autoformat\'" ~/.vimrc

cat >> ~/.vimrc << EOF
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

EOF


# Install a.vim
git clone https://github.com/vim-scripts/a.vim.git ~/.vim/bundle/a.vim

sed -i "/call vundle\#end()/i\Plugin \'vim-scripts\/a.vim\'" ~/.vimrc


# Install vim-airline and vim-airline-themes
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes

sed -i "/call vundle\#end()/i\Plugin \'vim-airline\/vim-airline\'" ~/.vimrc
sed -i "/call vundle\#end()/i\Plugin \'vim-airline\/vim-airline-themes\'" ~/.vimrc

cat >> ~/.vimrc << EOF
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'

EOF


# Install python-mode
# git clone https://github.com/python-mode/python-mode.git ~/.vim/bundle/python-mode

# sed -i "/call vundle\#end()/i\Plugin \'python-mode\/python-mode\'" ~/.vimrc


# Install jedi-vim
git clone https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim

sed -i "/call vundle\#end()/i\Plugin \'davidhalter\/jedi-vim\'" ~/.vimrc


# Install nerdcommenter
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter

sed -i "/call vundle\#end()/i\Plugin \'scrooloose\/nerdcommenter\'" ~/.vimrc


# Install syntastic
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

sed -i "/call vundle\#end()/i\Plugin \'vim-syntastic\/syntastic\'" ~/.vimrc

cat >> ~/.vimrc << EOF
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

EOF


# Install fcitx
git clone https://github.com/vim-scripts/fcitx.vim.git ~/.vim/bundle/fcitx.vim

sed -i "/call vundle\#end()/i\Plugin \'vim-scripts\/fcitx.vim\'" ~/.vimrc


# Install YouCompleteMe
git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive

~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang --system-boost

mkdir -p ~/.vim/ycm_config
wget -O ~/.vim/ycm_config/ycm_extra_conf.py https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py

sed -i "82a\\'-isystem\'," ~/.vim/ycm_config/ycm_extra_conf.py
sed -i "83a\\'/usr/include\'," ~/.vim/ycm_config/ycm_extra_conf.py
sed -i "84a\\'-isystem\'," ~/.vim/ycm_config/ycm_extra_conf.py
sed -i "85a\\'/usr/local/include\'," ~/.vim/ycm_config/ycm_extra_conf.py
sed -i "86a\\'-isystem\'," ~/.vim/ycm_config/ycm_extra_conf.py
sed -i "87a\\'/usr/include/c++/6.3.1\'," ~/.vim/ycm_config/ycm_extra_conf.py
sed -i "88a\\'-isystem\'," ~/.vim/ycm_config/ycm_extra_conf.py
sed -i "89a\\'/usr/include/c++/6.3.1/x86_64-pc-linux-gnu\'," ~/.vim/ycm_config/ycm_extra_conf.py

sed -i "/call vundle\#end()/i\Plugin \'Valloric\/YouCompleteMe\'" ~/.vimrc

cat >> ~/.vimrc << EOF
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_config/ycm_extra_conf.py'
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <space>       pumvisible() ? "\<C-y>" : "\<space>"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

EOF


# Install cmake
git clone https://github.com/vim-scripts/cmake.git ~/.vim/bundle/cmake
git clone https://github.com/vim-scripts/cmake.vim--Alcin.git ~/.vim/bundle/cmake.vim--Alcin

sed -i "/call vundle\#end()/i\Plugin \'vim-scripts\/cmake\'" ~/.vimrc
sed -i "/call vundle\#end()/i\Plugin \'vim-scripts\/cmake.vim--Alcin\'" ~/.vimrc


# Install tabular
git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular

sed -i "/call vundle\#end()/i\Plugin \'godlygeek\/tabular\'" ~/.vimrc


# Install vim-markdown
git clone https://github.com/plasticboy/vim-markdown.git ~/.vim/bundle/vim-markdown

sed -i "/call vundle\#end()/i\Plugin \'plasticboy\/vim-markdown\'" ~/.vimrc

cat >> ~/.vimrc << EOF
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0

EOF


# Install python-vim-instant-markdown
git clone https://github.com/isnowfy/python-vim-instant-markdown.git ~/.vim/bundle/python-vim-instant-markdown

sed -i "/call vundle\#end()/i\Plugin \'isnowfy\/python-vim-instant-markdown\'" ~/.vimrc


