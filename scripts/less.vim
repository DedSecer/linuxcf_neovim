" Vim script to work like "less"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2017 Mar 31
" Avoid loading this file twice, allow the user to define his own script.
"if exists("loaded_less")
"  finish
"endif
"let loaded_less = 1

" If not reading from stdin, skip files that can't be read.
" Exit if there is no file at all.
"if argc() > 0
"  let s:i = 0
"  while 1
"    if filereadable(argv(s:i))
"      if s:i != 0
"	sleep 3
"      endif
"      break
"    endif
"    if isdirectory(argv(s:i))
"      echomsg "Skipping directory " . argv(s:i)
"    elseif getftime(argv(s:i)) < 0
"      echomsg "Skipping non-existing file " . argv(s:i)
"    else
"      echomsg "Skipping unreadable file " . argv(s:i)
"    endif
"    echo "\n"
"    let s:i = s:i + 1
"    if s:i == argc()
"      quit
"    endif
"    next
"  endwhile
"endif

"fun! s:Forward()
"  " Searching forward
"  noremap <script> n H$nzt<SID>L
"  if &wrap
"    noremap <script> N H0Nzt<SID>L
"  else
"    noremap <script> N Hg0Nzt<SID>L
"  endif
"  cnoremap <silent> <script> <CR> <CR>:cunmap <lt>CR><CR>zt<SID>L
"endfun

"fun! s:Backward()
"  " Searching backward
"  if &wrap
"    noremap <script> n H0nzt<SID>L
"  else
"    noremap <script> n Hg0nzt<SID>L
"  endif
"  noremap <script> N H$Nzt<SID>L
"  cnoremap <silent> <script> <CR> <CR>:cunmap <lt>CR><CR>zt<SID>L
"endfun

"fun! s:NextPage()
"  if line(".") == line("$")
"    if argidx() + 1 >= argc()
"      " Don't quit at the end of the last file
"      return
"    endif
"    next
"    1
"  else
"    exe "normal! \<C-F>"
"  endif
"endfun

set ft=man
fun! s:End()
  set ma
  if exists('s:lz')
    let &lz = s:lz
  endif
  unmap h
  unmap H
  unmap <Space>
  unmap <C-V>
  unmap f
  unmap <C-F>
  unmap z
  unmap <Esc><Space>
  unmap F
  unmap d
  unmap <C-D>
  unmap <CR>
  unmap <C-N>
  unmap e
  unmap <C-E>
  unmap j
  unmap <C-J>
  unmap b
  unmap <C-B>
  unmap w
  unmap <Esc>v
  unmap u
  unmap <C-U>
  unmap k
  unmap y
  unmap <C-Y>
  unmap <C-P>
  unmap <C-K>
  unmap r
  unmap <C-R>
  unmap R
  unmap g
  unmap <
  unmap <Esc><
  unmap G
  unmap >
  unmap <Esc>>
  unmap %
  unmap p
  unmap n
  unmap N
  unmap q
  unmap v
  unmap /
  unmap ?
  unmap <Up>
  unmap <Down>
  unmap <PageDown>
  unmap <kPageDown>
  unmap <PageUp>
  unmap <kPageUp>
  unmap <S-Down>
  unmap <S-Up>
  unmap <Home>
  unmap <kHome>
  unmap <End>
  unmap <kEnd>


  map <c-y> "+y
  map <c-p> "+gp
endfun

fun! s:Help()
  echo "<Space>   One page forward          b         One page backward"
  echo "d         Half a page forward       u         Half a page backward"
  echo "<Enter>   One line forward          k         One line backward"
  echo "G         End of file               g         Start of file"
  echo "N%        percentage in file"
  echo "\n"
  echo "/pattern  Search for pattern        ?pattern  Search backward for pattern"
  echo "n         next pattern match        N         Previous pattern match"
  if &foldmethod != "manual"
  echo "\n"
    echo "zR        open all folds            zm        increase fold level"
  endif
  echo "\n"
  echo ":n<Enter> Next file                 :p<Enter> Previous file"
  echo "\n"
  echo "q         Quit                      v         Edit file"
  let i = input("Hit Enter to continue")
endfun

"set nocp
"syntax on
"set so=0
"set hlsearch
"set incsearch
"nohlsearch
"" Don't remember file names and positions
"set shada=
"set nows
"" Inhibit screen updates while searching
"let s:lz = &lz
"set lz


" Used after each command: put cursor at end and display position
"if &wrap
"  noremap <SID>L L0:redraw<CR>:file<CR>
"  au VimEnter * normal! L0
"else
"  noremap <SID>L Lg0:redraw<CR>:file<CR>
"  au VimEnter * normal! Lg0
"endif

" When reading from stdin don't consider the file modified.
au VimEnter * set nomod

" Can't modify the text
"set noma

" Give help
noremap h :call <SID>Help()<CR>
map H h


noremap j <c-e>
noremap k <c-y>

" If 'foldmethod' was changed keep the "z" commands, e.g. "zR" to open all
" folds.
"if &foldmethod == "manual"
"  map z <Space>
"endif

"map <Esc><Space> <Space>
" Re-read file and page forward "tail -f"
"map F :e<CR>G<SID>L:sleep 1<CR>F


" Redraw
"noremap <script> r <C-L><SID>L
"noremap <script> <C-R> <C-L><SID>L
"noremap <script> R <C-L><SID>L

" Start of file
noremap <script> g gg<SID>L

" End of file
"noremap <script> G G<SID>L

 "Go to percentage
"noremap <script> % %<SID>L
map p %

" Search
"noremap <script> / H$:call <SID>Forward()<CR>/
"if &wrap
"  noremap <script> ? H0:call <SID>Backward()<CR>?
"else
"  noremap <script> ? Hg0:call <SID>Backward()<CR>?
"endif


"call s:Forward()
"cunmap <CR>

" Quitting
noremap q :q<CR>

" Switch to editing (switch off less mode)
"map v :silent call <SID>End()<CR>

" vim: sw=2
