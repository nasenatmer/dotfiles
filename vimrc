" Section: Vundle {{{1
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/ScrollColors'
Plugin 'lervag/vim-latex'
	let g:latex_enabled = 1
Plugin 'transvim.vim'
	let g:trv_dictionary="/usr/share/dict/de-en.txt"
Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-airline'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#whitespace#enabled = 0
	let g:airline#extensions#tmuxline#enabled = 0
	let g:airline_theme = "understated" "nice ones: wombat, murmur and understated
Plugin 'SirVer/ultisnips'
	" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
	let g:UltiSnipsListSnippets="<c-L>"
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"
Plugin 'Sirver/vim-snippets'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" All of your Plugins must be added before the following line
call vundle#end()            " required 1}}}

" Section: Options {{{1
runtime! plugins/sensible.vim   " set sensible options now
set shell=zsh			" shell to start with
set nobackup			" don't make backup files
set noshowmode			" don't show current mode (done by airline)
set t_Co=256			" tell vim that terminal supports 256 colors 
set ignorecase			" case insensitive search
set smartcase			" only c. sensitive if uppercase letter in exp 
set hlsearch			" highlight all search results
set mouse=a			" enable scrolling with mouse (keyboard god, 
set foldmethod=marker		" enable folding in vim by using markers
set shiftwidth=2
set textwidth=78
colorscheme evening
"tango2, elflord, blackbeauty, breeze, marklar, sean, oceanlight, dante, slate
" 1}}}

" Section: Mappings {{{1
" keyboard mappings adapted to bone keyboard layout: wiki.neo-layout.org/bone
noremap j h
noremap h j
noremap l k
noremap k l

"""" other mappings to make life easier
" use tabedit
nmap t :tabedit 
" alias üü to <Esc> key. Handy for people with German keyboard layouts.
inoremap üü <Esc>
vnoremap üü <Esc>
" alias "mm" to ":write" and "q" to ":quit" without saving
map mm :w!<CR>
map q :q!<CR>
" start a new change before doing <c-u> (and be able to undo it with u)
" (wikia/recover from accidental Ctrl-U)
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Completion and Functions Mappings to FN keys 
" <F1> toggle spell option
   nmap <silent> <F1> :call ToggleSpell()<CR>
" <F2> <c-x><c-T> completion: keywords using thesaurus
   ino <silent> <F2> <c-x><c-t>
   set thesaurus+=/home/jakob/.vim/thesaurus/roget13a.txt
" <F3> <c-x><c-I> completion: keywords in current and included files
   ino <silent> <F3> <c-x><c-i>
" <F4> <c-x><c-O> completion: omni completion
   ino <silent> <F4> <c-x><c-o>
" <F5> empty
" <F6> saves file  in insert mode
   imap <F6> <Esc>:w<CR>a
" <F7> empty
" <F8> toggle formatoptions=a value
   no <F8> :call ToggleFO()<CR>
   ino <F8> <Esc>:call ToggleFO()<CR>
" <F9> empty
" <F10> toggle Paste mode
   set pastetoggle=<F10>
" <F11> empty
" <F12> echo all FN key functions
   ino <silent> <F12> <Esc> <Esc>:echo '[F1:spelltoggle F2:thes F3:keywrd F4:omni - F6:":w" F8:fo-toggle F10:pastetoggle]' <CR>
   no <silent> <F12> <Esc> <Esc>:echo '[F1:spelltoggle F2:thes F3:keywrd F4:omni - F6:":w" F8:fo-toggle F10:pastetoggle]' <CR>

" 1}}}

" Section: Autocommands (incl. FTOptions){{{1
if has("autocmd")
  augroup FTOptions
    autocmd!
    autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
    autocmd FileType markdown,text,txt setlocal textwidth=78 nolist
	  \ formatoptions=tcqwan colorcolumn=+2
	  \ number numberwidth=2 cpoptions+=n iskeyword+=:
    autocmd FileType xml let g:xml_syntax_folding=1	
    autocmd FileType tex let g:tex_flavor='latex' |
	  \ let g:latex_complete_close_braces = 1 |
	  \ let g:latex_quickfix_mode = 0 |
	  \ let g:latex_fold_preamble = 1 |
	  \ let g:latex_view_method = 'zathura' |
	  \ let g:latex_quickfix_ignored_warnings = [
		  \ 'Underfull',
		  \ 'Overfull',
		  \ 'specifier changed to',
		  \ 'Using preliminary',
		  \ 'xparse/redefine-command',
		  \ ] |
	  \ setlocal formatoptions+=tcqwan textwidth=106
	  \ number numberwidth=2 cpoptions+=n iskeyword+=:
  augroup END
augroup vimrcEx
    autocmd!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
	  \ if line("'\"") > 0 && line("'\"") <= line("$") |
	  \   exe "normal g`\"" |
	  \ endif
    autocmd BufEnter * checktime
    autocmd VimEnter ~/doc* setlocal textwidth=106 spell spelllang=en_gb,de_de colorcolumn=
  augroup END
endif " has("autocmd") "}}}1

" Section: Functions {{{1

" Formatopions Toggle tcgwn - tcgwan {{{2
function! ToggleFO ()
   if (&formatoptions == 'tcqwan')
      set formatoptions=tcqwn
      echo "formatoptions -> tcqwn"
   else
      set formatoptions=tcqwan
      echo "formatoptions -> tcqwan"
   endif
endfunction " 2}}}

" Spell Check Toggle {{{2
let b:myLang=0
let g:myLangList=["nospell","en_gb,de_de","de_de","en_gb"]
function! ToggleSpell()
   let b:myLang=b:myLang+1
   if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
   if b:myLang==0
      setlocal nospell
   else
      execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
   endif
   echo "spell checking language:" g:myLangList[b:myLang]
endfunction " 2}}}

" UltiSnips: Use <c-l> to list snippets when not the whole trigger is typed yet {{{2
function! ExpandPossibleShorterSnippet()
   if len(UltiSnips#SnippetsInCurrentScope()) == 1 "only one candidate...
      let curr_key = keys(UltiSnips#SnippetsInCurrentScope())[0]
      normal diw
      exe "normal a" . curr_key
      exe "normal a "
      return 1
   endif
   return 0
endfunction
inoremap <silent> <C-l> <C-R>=(ExpandPossibleShorterSnippet() == 0? '': UltiSnips#ExpandSnippet())<CR>
" 2}}} 

" 1}}}
