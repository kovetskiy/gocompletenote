vim go complete helper
================

Now this plugin has dependencies:
- vim-go
- UltiSnips

Installation
===========

```viml
Plug 'kovetskiy/vim-go-complete-utils'
```

Bindings:
```viml
inoremap <C-E> <C-O>:call GoCompleteNote()<CR><C-O>a
inoremap <C-Y> <C-R>=GoCompleteSnippet()<CR>
```

Todo
====
- [ ] Usage example (gif)
