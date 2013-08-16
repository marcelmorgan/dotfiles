 set nocompatible
 "helptags ~/.vim/doc

 " https://github.com/skwp/dotfiles/blob/master/vimrc

 set incsearch
 set ignorecase
 " set number
 set smartindent
 set cinoptions=:0,p0,t0
 set cinwords=if,else,while,do,for,switch,case,def,class,begin
 set cindent
 set autoindent
 "set paste - causes auto indent to not work!
 "folding settings
 "set foldmethod=indent   "fold based on indent
 "set foldnestmax=10      "deepest fold is 10 levels
 ""set nofoldenable        "dont fold by default
 "set foldlevel=1         "this is just what i use

 "because spelling is important to me
 set spell spelllang=en
 " zg to add word to word list
 " " zw to reverse
 " " zug to remove word from word list
 " " z= to get list of possibilities
 set spellfile=~/.vim/spellfile.add
 set nospell

 set title
 syntax on
 filetype off
 filetype plugin indent on
 set encoding=utf-8
 set ruler
 " set number
 set tabstop=2
 set shiftwidth=2
 set expandtab
 set softtabstop=2
 set wrap
 set autoread
 set incsearch
 set modifiable
 " Normal behaviour of backspace key
 set backspace=indent,eol,start
 let mapleader = ","

 " Set terminal to 256 colors
 set t_Co=256
 " Textmate scheme colors clone
 set background=dark
 colorscheme railscasts
 "syntax enable
 "set background=dark
 "let g:solarized_termcolors=256
 "colorscheme solarized

 "Override theme's spell local
 highlight clear SpellLocal
 highlight SpellLocal term=underline cterm=underline

 " don't keep backup after close
 " set nobackup
 " " do keep a backup while working
 " set writebackup
 " " Store temporary files in a central spot
 " set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
 " set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
 " " Set tag files
 " set tags=tags,./tags,tmp/tags,./tmp/tags

 " This makes vim act like all other editors, buffers can
 " exist in the background without being in a window.
 " http://items.sjbach.com/319/configuring-vim-right
 set hidden
 " ================ Turn Off Swap Files ==============

 set noswapfile
 set nobackup
 set nowb

 " ================ Persistent Undo ==================
 " Keep undo history across sessions, by storing in file.
 " Only works all the time.

 silent !mkdir ~/.vim/backups > /dev/null 2>&1
 set undodir=~/.vim/backups
 set undofile
 " Display tabs and trailing spaces visually
 "
 set list listchars=tab:\ \ ,trail:·

 " set nowrap       "Don't wrap lines
 set linebreak    "Wrap lines at convenient points

 " Additional Ruby Syntax Highlighting
 au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
 " RDOC Syntax Highlighting
 autocmd BufRead,BufNewFile *.rd,*.rdoc set filetype=rdoc

 set ls=2 " Always show status line
 set statusline=%F%m%r%h%w\ (%{&ff})[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

 map <C-3> :tabn<CR>
 map <C-1> :tabnew<CR>
 map <C-2> :tabp<CR>
 " map <F7> :w\|:!pdflatex thesis.tex<CR><CR>
 "

 "No more arrow keys for me
 noremap  <Up> ""
 noremap! <Up> <Esc>
 noremap  <Down> ""
 noremap! <Down> <Esc>
 noremap  <Left> ""
 noremap! <Left> <Esc>
 noremap  <Right> ""
 noremap! <Right> <Esc>

 autocmd BufWritePre * :%s/\s\+$//e

 " " Q. How can I open a NERDTree automatically when vim starts up if no files
 " " were specified?
 " autocmd vimenter * if !argc() | NERDTree | endif
 "
 " " Q. How can I map a specific key or shortcut to open NERDTree?
 " map <C-n> :NERDTreeToggle<CR>
 "
 " " Q. How can I close vim if the only window left open is a NERDTree?
 " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 "
 call pathogen#infect()


 command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
 function! QuickfixFilenames()
   " Building a hash ensures we get each buffer only once
   let buffer_numbers = {}
   for quickfix_item in getqflist()
     let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
   endfor
   return join(values(buffer_numbers))
 endfunction

 function! Smart_TabComplete()
   let line = getline('.')                         " current line

   let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                   " line to one character right
                                                   " of the cursor
   let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
   if (strlen(substr)==0)                          " nothing to match on empty string
     return "\<tab>"
   endif
   let has_period = match(substr, '\.') != -1      " position of period, if any
   let has_slash = match(substr, '\/') != -1       " position of slash, if any
   if (!has_period && !has_slash)
     return "\<C-X>\<C-P>"                         " existing text matching
   elseif ( has_slash )
     return "\<C-X>\<C-F>"                         " file matching
   else
     return "\<C-X>\<C-O>"                         " plugin matching
   endif
 endfunction

 "inoremap <tab> <c-r>=Smart_TabComplete()<CR>
