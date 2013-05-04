" a: auto-format. w: line that ends w/ white-space: paragraph continues; everything else: end of paragraph
set formatoptions=tcqwan
set textwidth=106

"set numbercolumn in markdown documents
set number
set numberwidth=2
set cpoptions+=n 		" use the nr column for wrapped lines

" Compile markdown documents to html with "mm" and "<F6>" and to pdf with "\ll"
" requires pandoc and wkhtmltopdf and a possibly nice css a folder of your
" choice (pandoc has a mediocre standard css)
map <LocalLeader>ll :silent !pandoc -c ~/doc/linux/css/github.css "%" \| wkhtmltopdf - "%:r".pdf<CR>:redraw!<CR>
map mm :w<CR>:silent !pandoc -c ~/doc/linux/css/github.css "%" > "%:r".html <CR>:redraw!<CR>
imap <F6> :w<CR>:silent !pandoc -c ~/doc/linux/css/github.css "%" > "%:r".html <CR>:redraw!<CR>

map <LocalLeader>lv :! xdg-open "%:r".html &>/dev/null &<CR>:redraw!<CR>
map <LocalLeader>lvv :! xdg-open "%:r".pdf &>/dev/null &<CR>:redraw!<CR>
