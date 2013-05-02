" a: auto-format. w: line that ends w/ white-space: paragraph continues; everything else: end of paragraph
set formatoptions=tcqwan
set textwidth=106
set wm=1

"set numbercolumn in markdown documents
set number
set numberwidth=2
set cpoptions+=n 		" use the nr column for wrapped lines

" Compile markdown documents to html with "mm" and "F<6>" and to pdf with "\ll"
map <LocalLeader>ll :silent !pandoc -c ~/doc/linux/css/main.css "%" \| wkhtmltopdf - "%:r".pdf<CR>:redraw!<CR>
"map mm :w<CR>:silent !pandoc -c ~/doc/linux/css/main.css "%" \| wkhtmltopdf - 
""%:r".pdf<CR>:redraw!<CR>
map mm :w<CR>:silent !pandoc -c ~/doc/linux/css/main.css "%" > "%:r".html <CR>:redraw!<CR>

"imap <F6> :w<CR>:silent !pandoc -c ~/doc/linux/css/main.css "%" \| wkhtmltopdf - 
""%:r".pdf<CR>:redraw!<CR>a
imap <F6> :w<CR>:silent !pandoc -c ~/doc/linux/css/main.css "%" > "%:r".html <CR>:redraw!<CR>

map <LocalLeader>lv :! xdg-open "%:r".html &>/dev/null &<CR>:redraw!<CR>
map <LocalLeader>lvv :! xdg-open "%:r".pdf &>/dev/null &<CR>:redraw!<CR>

" toggle formatoptions=a value
no <F8> :call ToggleFO()<CR>
ino <F8> :call ToggleFO()<CR>

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

