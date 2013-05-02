" have automatic mkview + loadview
"autocmd BufWinLeave * silent! mkview 
"autocmd BufWinEnter * silent! loadview

" a: auto-format. w: line that ends w/ white-space: paragraph continues; everything else: end of paragraph
set formatoptions+=tcqwan
set textwidth=106
set wm=1

" when marking text in visual mode, pressing F7 wraps it in curly braces and puts curser in front of them. 
"shift+F7 puts it in \begin{}\end{} tags.
imap <buffer> << 		\emph{
imap <buffer> ((		\autocite[
"imap <buffer> [[ 		\begin{
imap <buffer> [[ 		\textcite[
imap <buffer> ))		<Plug>LatexCloseCurEnv
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

" LaTeX-Box settings
"	let g:LatexBox_viewer = "xdg-open"
	"open viewer and monitor it continuously. -c does auto-updating
	let g:LatexBox_latexmk_options = '-pvc -xelatex' 
	let g:LatexBox_cite_pattern = '\c\\\a*cite\a*\*\?\(\[[^\]]*\]\)\_\s*{'
	let LatexBox_ref_pattern = '\C\\v\?\(eq\|page\|[cC]\)\?ref\*\?\_\s*{'
	let g:LatexBox_fold_envs = 1
	let g:LatexBox_Folding = 'yes'
	let g:LatexBox_fold_preamble = 1

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
  autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
  autocmd InsertLeave * let &l:foldmethod=w:last_fdm
