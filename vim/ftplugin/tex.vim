let g:tex_flavor = "latex" 	" defaults *.tex to flavor=latex

" a: auto-format. w: line that ends w/ white-space: paragraph continues; everything else: end of paragraph
set formatoptions+=tcqwan
set textwidth=106

" Settings for vim-latex
  let g:latex_complete_close_braces = 1
  let g:latex_quickfix_mode = 0
  let g:latex_quickfix_open_on_warning = 0

" Some aliases to make writing LaTeX documents with biblatex easier
"imap <buffer> << 		\emph{
"imap <buffer> ((		\autocite[
"imap <buffer> {{		\textbf{

" Those below require LaTeX-Box or vim-latex to be installed!
" imap <buffer> ))		<Plug>LatexCloseCurEnv
" when marking text in visual mode, pressing F7 wraps it in curly braces and puts cursor in front of it.
" shift+F7 puts it in \begin{}\end{} tags.
vmap <buffer> <F7>		<Plug>LatexWrapSelection
vmap <buffer> <S-F7>		<Plug>LatexEnvWrapSelection

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

"set numbercolumn in latex documents
set number
set numberwidth=2
set cpoptions+=n 		" use the nr column for wrapped lines
autocmd VimEnter ~/ba/*,~/doc* call ToggleSpell()
