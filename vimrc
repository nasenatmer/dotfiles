set nocompatible		" must be first, because it changes other options as a side effect.
set shell=zsh			" shell to start with
set encoding=utf-8		" set encoding to utf-8
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set nobackup			" don't make backup files
set history=50			" keep 50 lines of command line history
set laststatus=2		" Always show the statusline (required for powerline)
set noshowmode			" don't show current mode (done by powerline)
set t_Co=256			" Explicitly tell vim that the terminal supports 256 colors (also required for powerline)
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set ignorecase			" case insensitive
set smartcase			" if search pattern contains uppercase letter, search is case sensitive. If only lowercase letters present, search is case insensitive
set hlsearch			" highlight all search results	
set pastetoggle=<F10>		" Set a toggle for pasting input
colorscheme tango2		" tango2, elflord, blackbeauty, satori, marklar, sean,  caramel, oceanlight, dante, slate
set nocursorline		" disable cursorline with schemes like tango2
"set guifont="Courier New 12" 	" A clean-looking font for gvim
syntax on			" Switch Syntax Highlighting on
let g:tex_flavor = "latex" 	" defaults *.tex to flavor=latex
let g:xml_syntax_folding = 1	" automatic syntax based folding for xml files
let $PAGER=''			" clear $PAGER for vim

"set rnu				" set relative instead of absolute linenumbers

"""" keyboard mappings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" and now for bone2 (https://wiki.neo-layout.org/bone2 )
no j h
no h j
no l k
no k l

"""" other mappings to make life easier
" use tabedit
nmap t :tabedit 
" use üü to enter normal mode 
inoremap üü <Esc>
vnoremap üü <Esc>
" Don't use Ex mode, use Q for formatting
map Q gq
map mm :w!
map q :q!

 " Vundle section %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 " vim-scripts repos
 Bundle 'vim-scripts/ScrollColors'
 " original repos on github
	 let g:Powerline_stl_path_style = 'short'
" Bundle 'Markdown'	 
 Bundle 'LaTeX-Box-Team/LaTeX-Box'
	"LatexBox settings are to be found in ~/.vim/ftplugin/tex.vim%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 " vim-scripts repos
 Bundle 'transvim.vim'
	 " enable transvim.vim translator
	  let g:trv_dictionary="/usr/share/dict/de-en.txt"
 " filetype plugin indent on     " required! (Jakob: comes later in autocmd section anyways)
 "
 "NOTE: comments after Bundle command are not allowed..
 " end of Vundle section %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  au BufEnter * checktime
  
  " Don't screw up folds when inserting text that might affect them, until
  " leaving insert mode. Foldmethod is local to the window.
"  autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
"  autocmd InsertLeave * let &l:foldmethod=w:last_fdm

    augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

""""""" Functions
" Toggle NuMode
function! g:ToggleNuMode()
	if(&rnu == 1)
		set nu
	else
		set rnu
	endif
endfunc

" formatoptions toggle
function! ToggleFO ()
   if (&formatoptions == 'tcqwan')
      set formatoptions=tcqwn
      echo "formatoptions -> tcqwn"
   else
      set formatoptions=tcqwan
      echo "formatoptions -> tcqwan"
   endif
endfunction

" Spell Check
let b:myLang=0
let g:myLangList=["nospell","de_de","en_gb"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

	" New Omni-Completion mapped to F1-F12
	" <F1>   <c-x><c-L> completion: whole line
	ino <silent> <F1> <c-x><c-l>
	" <F2>   <c-x><c-T> completion: keywords using thesaurus
	ino <silent> <F2> <c-x><c-t>
"	set thesaurus+=/home/jakob/.local/share/openthesaurus.txt
"	set thesaurus+=/usr/share/mythes/th_en_GB_v2.dat
	set thesaurus+=/home/jakob/.vim/thesaurus/roget13a.txt
"	set thesaurus+=/home/jakob/.vim/thesaurus/mthesaur.txt
	" <F3>   <c-x><c-I> completion: keywords in current and included files
	ino <silent> <F3> <c-x><c-i>
	" <F4>   <c-x><c-O> completion: omni completion
	ino <silent> <F4> <c-x><c-o>
	" <F5>   toggle relative/absolute linenumbers
	nnoremap <f5> :call g:ToggleNuMode()<cr>
	" <F6> saves file  in insert mode
	imap <F6> :wa
	" <F7>	 toggle spell de/en/none
	nmap <silent> <F7> :call ToggleSpell()<CR>
	" toggle formatoptions=a value
	no <F8> :call ToggleFO()<CR>
	ino <F8> :call ToggleFO()<CR>
ino <silent> <F12>  :echo '[F1:line F2:thes F3:keywrd F4:omni - F5:toggle-no/rnu F6:":w" F7:toggle spell F8:fo-toggle F10:pastetoggle]' <CR>
no <silent> <F12>  :echo '[F1:line F2:thes F3:keywrd F4:omni - F5:toggle-no/rnu F6:":w" F7:toggle spell F8:fo-toggle F10:pastetoggle]' <CR>

