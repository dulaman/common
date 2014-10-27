"max zkładek otwartych
set tabpagemax=20

"kolor tła
set background=dark
set mouse=a
"integracje ze schowkiem systemowym
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"pathogen
execute pathogen#infect()
syntax on
"pluginy
filetype plugin indent on

"mapowanie (t w Nerdtree)
let NERDTreeMapOpenInTab='<F12>'

:inoremap <F2> <Esc>:w<CR>i "zapis
:inoremap <F3> <Esc>ui "cofanie w trybie wstawiania
:inoremap <F4> <Esc><C-R>i "powtarznie w insert
:inoremap <C-U> <Esc>Pi "wklejanie w insert
:inoremap <C-O> <Esc>pi "wklejanie w insert prawa strona
:inoremap <C-D> <Esc>ddi "usuwanie lini w insert
":inoremap ( ()<Esc>i 
":inoremap [ []<Esc>i "domykanie
":inoremap {<CR> {<Esc>:call Curly()<CR>i "domykanie klamr //następna linia
:map <F2> :w<CR> "zapis
:map <F3> ui "cofanie + insert
:map <F4> <C-R>i "powtrzanie + insert
:map <F5> i<End><CR><Esc> "dadawanie linii
:map <F7> gT 
:map <F8> gt
:map ll "_ddP "schowek zamiast bieżacej linii
:map lk "_dP "j.w. dla zazanaczenia
:map de "_dd "usuwanie linii bez zapisywania do schowka
:map ay :%y+<CR> "select all
:map ad :%d+<CR> "wycianie wszystkiego z pliku
:map t <CR>:Tab %<CR> "jak t w nerdtree + backup


:setlocal omnifunc=javacomplete#Complete "uzupełnianie w Javie

:function Curly() "dopełnienie klamry
:	let line = getline('.')
:	let tabsnr = 0
:	let i = 0
:	while i<len(line)
:		if line[i] != '\t'
:			break
:		endif
:		let tabsnr += 1
:		let i += 1
:	endwhile
:	exec 'put="ewgewgewgewgewgewgewgew"'
:	exec 'put="' . repeat('\t', tabsnr+1) . '"'
:	exec 'put="' . repeat('\t', tabsnr) . '}"'
:endfunction


:function Tab(name) "backup przy twarciu w nowej karcie
:	echo system('spi.sh ' . a:name)
:	exec "tabedit " . a:name
:endfunction

command! -nargs=1 -complete=file Tab call Tab('<args>') "przypisanie do fukcji tabe

:function CloseAll() "zamykanie wszystkich kart z backupem
:	redir => message
:  	silent execute "tabs"
:  	redir END
:	let messages = split(message,'\n')
:	for i in messages
:		if i !~ '^Tab'
:			echo system('spi.sh ' . i[4:])
:		endif
:	endfor
:	exec "qa"
:endfunction

command! -nargs=0 CloseAll call CloseAll() 

:function Close() "zamknięcie pliku z backupem
:	redir => message
:  	silent execute "echo @%"
:  	redir END
:	echo system('spi.sh ' . message[1:])
:	exec "q"
:endfunction

command! -nargs=0 Close call Close()


:setlocal omnifunc=javacomplete#Complete 

:function Curly()
:	let line = getline('.')
:	let tabsnr = 0
:	let i = 0
:	while i<len(line)
:		if line[i] != '\t'
:			break
:		endif
:		let tabsnr += 1
:		let i += 1
:	endwhile
:	exec 'put="ewgewgewgewgewgewgewgew"'
:	exec 'put="' . repeat('\t', tabsnr+1) . '"'
:	exec 'put="' . repeat('\t', tabsnr) . '}"'
:endfunction


:function Tab(name)
:	echo system('spi.sh ' . a:name)
:	exec "tabedit " . a:name
:endfunction

command! -nargs=1 -complete=file Tab call Tab('<args>')

:function CloseAll()
:	redir => message
:  	silent execute "tabs"
:  	redir END
:	let messages = split(message,'\n')
:	for i in messages
:		if i !~ '^Tab'
:			echo system('spi.sh ' . i[4:])
:		endif
:	endfor
:	exec "qa"
:endfunction

command! -nargs=0 CloseAll call CloseAll()

:function Close()
:	redir => message
:  	silent execute "echo @%"
:  	redir END
:	echo system('spi.sh ' . message[1:])
:	exec "q"
:endfunction

command! -nargs=0 Close call Close()
