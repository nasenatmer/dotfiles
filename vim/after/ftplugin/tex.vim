let g:tex_flavor = "latex" 	" defaults *.tex to flavor=latex

" a: auto-format. w: line that ends w/ white-space: paragraph continues; everything else: end of paragraph
set formatoptions+=tcqwan
set textwidth=106

" LatexBox settings
"	let g:LatexBox_Folding = 1
"	let g:LatexBox_latexmk_async = 1
"	let g:LatexBox_latexmk_preview_continuously = 1
"	let g:LatexBox_latexmk_options = '-xelatex'

" Some aliases to make writing LaTeX documents with biblatex easier 
imap <buffer> << 		\emph{
imap <buffer> ((		\autocite[
"imap <buffer> [[ 		\textcite[
imap <buffer> {{		\textcite[
" Those below require LaTeX-Box to be installed!
" https://github.com/LaTeX-Box-Team/LaTeX-Box
imap <buffer> ))		<Plug>LatexCloseCurEnv
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
