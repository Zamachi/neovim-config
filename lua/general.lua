-- dozvoljava da koristimo mis da setujemo kursor
vim.cmd('set mouse=a')
-- boje neophodne ako koristimo terminal?
vim.cmd('set termguicolors')
-- prikazuje broj linije sa leve strane
vim.cmd('set number')
-- podesavanje fonta - FONT MORA BITI INSTALIRAN I NERD COMPATIBLE
vim.cmd('set guifont=FiraCode\\ NF\\:h12:w57')
vim.cmd('set hidden') -- zadrzava bilo koji bafer koji smo editovali u pozadini(moze se otvoriti opet), tako da uvek mozemo da se vratimo na njega i sacuvamo ga/discardujemo promene

-- kazemo mu da ne kesira podatke i ne bekapuje
vim.cmd('set noswapfile')
vim.cmd('set nobackup')
vim.cmd('set nowritebackup')

-- visina command prozora(default je 1)
vim.cmd('set cmdheight=2')
vim.cmd('set updatetime=300')
vim.cmd('set signcolumn=number')

-- (Neo)vim po defaultu tabove ostavlja na 8 space-ova, to resava ovaj problem
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab') -- u insert 
vim.cmd('set smartindent') -- dodatak autoindentu

-- nakon sto zavrsimo pretragu sa / , stvari ne ostaju highlightovane
vim.cmd('set nohlsearch')

-- ako ne zelimo text wrapping ,ukljuciti sledecu opciju
--vim.cmd('set nowrap')

--inkrementalna pretraga(highlight)
vim.cmd('set incsearch')

--Special thanks to Github user Awpteamoose who provided us with the option below, it disables default Nvim-qt GUI look for popup menus, this allows it to fit a specific theme
vim.cmd('call rpcnotify(0, "Gui", "Option", "Popupmenu", 0)')
-- Thanks to BoltsJ for providing the following solution for disabling ugly tabs in Nvim-Qt, the following uses Terminal User Interface tablines
vim.cmd('call rpcnotify(0, "Gui", "Option", "Tabline", 0)')

--(Neo)vim ima neka cudna formatiranja kada pasteujemo tekst, ovo bi "trebalo" da ispravi to, radi za paste p/P u NORMAL mode-u, ne radi bas najbolje sa Shift-Insert
vim.cmd('set formatoptions-=t')
vim.cmd('set formatoptions-=c')
vim.cmd('set formatoptions-=r')
vim.cmd('set formatoptions-=o')
vim.cmd('set clipboard=unnamed')

-- kada smo 8 linija daleko od dna, tek tada pocinje da skorluje, znaci neki offset koji kaze kada da pocnemo skrolovati
vim.cmd('set scrolloff=12')

vim.cmd('filetype plugin on')

--preporuceno za rad sa auto-session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,resize,winpos,terminal"
