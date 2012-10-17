" This file contains changes intended only for GUI mode.

if has("gui_running")
   " If you're using MacVim, you'll want to use the experimental renderer for
   " this
   " set transp=5
  
   "" gui options
   " a - Autoselect
   " c - Use console dialogs instead of popup dialogs for simple choices.
   " 
   " more interesting, what is absent: no menu, no toolbar, no scrollbars.
   set guioptions=ac

   " Font settings. Change as you will.
   " set guifont=Monaco:h12
   :set lines=68
   :set columns=140
endif
