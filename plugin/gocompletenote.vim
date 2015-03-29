let g:gohelp_bufnr=-1

function! GoCompleteNote()
    let note = go#complete#GetInfo()
    let current_view = winsaveview()
    let current_winnr = winnr()

    let should_create_win = 1

    let top_delta = 0
    let old_top_delta = 0

    if g:gohelp_bufnr != -1
        let winnr = bufwinnr(g:gohelp_bufnr)
        if winnr != -1
            let should_create_win = 0
            execute winnr 'wincmd w'

            " + 1 for statusline
            let old_top_delta = line('$') + 1

            execute 'normal ggdG'
        endif
    endif

    if should_create_win
        execute 'new note'
        let g:gohelp_bufnr = bufnr('%')
        let current_winnr = current_winnr + 1
    endif

    execute 'normal i' . note
    execute 'normal gggqG'

    let lines_count = line('$')
    execute 'resize ' . lines_count
    execute 'normal zb'

    " + 1 for statusline
    let top_delta = (lines_count + 1) - old_top_delta
    let current_view.topline = current_view.topline + top_delta

    execute current_winnr 'wincmd w'
    call winrestview(current_view)
endfunction!
