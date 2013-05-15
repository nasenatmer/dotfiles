augroup filetypedetect
autocmd BufNewFile,BufRead *.wiki       setf wikipedia
autocmd BufNewFile,BufRead *.tex	setf tex
autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn}   setf markdown

augroup END
