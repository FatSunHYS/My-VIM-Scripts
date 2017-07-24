#!/bin/bash

set -e
set -x

rm -rf ~/.vimrc
rm -rf ~/.vim

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


# Install nerdcommenter
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter

sed -i "/call vundle\#end()/i\Plugin \'scrooloose\/nerdcommenter\'" ~/.vimrc



# Install fcitx
git clone https://github.com/vim-scripts/fcitx.vim.git ~/.vim/bundle/fcitx.vim

sed -i "/call vundle\#end()/i\Plugin \'vim-scripts\/fcitx.vim\'" ~/.vimrc


# Install cmake
git clone https://github.com/vim-scripts/cmake.git ~/.vim/bundle/cmake
git clone https://github.com/vim-scripts/cmake.vim--Alcin.git ~/.vim/bundle/cmake.vim--Alcin

sed -i "/call vundle\#end()/i\Plugin \'vim-scripts\/cmake\'" ~/.vimrc
sed -i "/call vundle\#end()/i\Plugin \'vim-scripts\/cmake.vim--Alcin\'" ~/.vimrc


# Install vim-colors-solarized
git clone https://github.com/altercation/vim-colors-solarized ~/.vim/bundle/vim-colors-solarized

sed -i "/call vundle\#end()/i\Plugin \'altercation\/vim-colors-solarized\'" ~/.vimrc

cat >> ~/.vimrc << EOF
set background=dark
colorscheme solarized

EOF


# Install tabular
git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular

sed -i "/call vundle\#end()/i\Plugin \'godlygeek\/tabular\'" ~/.vimrc


