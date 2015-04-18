function! GoCompleteSnippet()
    let note   = go#complete#GetInfo()

    if empty(note)
        return ""
    endif

    let pieces = split(note, '(')
    let fnName = substitute(pieces[0], 'func ', '', '')
    let fnArgs = split(split(pieces[1], ')')[0], ', ')

    let snipArgs = []
    let snipArgv = 1
    for fnArg in fnArgs
        let snipArgs = snipArgs + ['${' . snipArgv . ':' . fnArg . '}']
        let snipArgv = snipArgv + 1
    endfor

    let snippet = '(' . join(snipArgs, ', ')  . ')'

    return UltiSnips#Anon(snippet, '')
endfunction!
