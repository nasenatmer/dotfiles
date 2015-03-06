" Compile markdown documents to html with "mm" and to pdf with "\ll"
" requires pandoc and wkhtmltopdf and a possibly nice css 
map <LocalLeader>ll :silent !pandoc -c ~/doc/linux/css/github.css "%" \| wkhtmltopdf - "%:r".pdf<CR>:redraw!<CR>
map mm :w<CR>:silent !pandoc -c ~/doc/linux/css/github.css "%" > "%:r".html <CR>:redraw!<CR>
imap <F6> <Esc>:w<CR>:silent !pandoc -c ~/doc/linux/css/github.css "%" > "%:r".html <CR>:redraw!<CR>

" open html output file with "\lv" and pdf with "\lvv"
map <LocalLeader>lv :! xdg-open "%:r".html &>/dev/null &<CR>:redraw!<CR>
map <LocalLeader>lvv :! xdg-open "%:r".pdf &>/dev/null &<CR>:redraw!<CR>
