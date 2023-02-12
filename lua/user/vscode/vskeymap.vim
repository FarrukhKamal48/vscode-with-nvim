" TODO there is a more contemporary version of this file
"VSCode
function! s:split(...) abort
    let direction = a:1
    let file = a:2
    call VSCodeCall(direction == 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if file != ''
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, file == '' ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> == '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

nnoremap <silent> <C-w>s :call <SID>split('h')<CR>
xnoremap <silent> <C-w>s :call <SID>split('h')<CR>

nnoremap <silent> <C-w>v :call <SID>split('v')<CR>
xnoremap <silent> <C-w>v :call <SID>split('v')<CR>

nnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>
xnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>

"" explorer " 
" nnoremap <silent> <C-f>f :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
" nnoremap <silent> <Space>ee :call VSCodeNotify('workbench.view.explorer')<CR>


" Navigate editors " done in vscode => keybinds.json
" nnoremap <silent> <S-h> :call VSCodeNotify('workbench.action.previousEditor')<CR>
" nnoremap <silent> <S-l> :call VSCodeNotify('workbench.action.nextEditor')<CR>


"" save and quit individual file
" nnoremap <silent> s :call VSCodeNotify('workbench.action.files.save')<CR>
" nnoremap <silent> q :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

"" save and quit all
" nnoremap <silent> <C-s> :call VSCodeNotify('workbench.action.files.saveFiles')<CR>
" nnoremap <silent> <C-q> :call VSCodeNotify('workbench.action.closeAllEditors')<CR>


" line end and start " done in vscode
" nnoremap <silent> n :call VSCodeNotify('cursorLineStart')<CR>
" nnoremap <silent> m :call VSCodeNotify('cursorLineEnd')<CR>
" xnoremap <silent> n :call VSCodeNotify('cursorLineStart')<CR>
" xnoremap <silent> m :call VSCodeNotify('cursorLineEnd')<CR>


" file end and start
" nnoremap <silent> <S-n> :call VSCodeNotify('list.focusFirst')<CR>
" nnoremap <silent> <S-m> :call VSCodeNotify('list.focusLast')<CR>
" xnoremap <silent> <S-n> :call VSCodeNotify('list.focusFirst')<CR>
" xnoremap <silent> <S-m> :call VSCodeNotify('list.focusLast')<CR>



nnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
xnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>

nnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
nnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>

" Better Navigation " done in vscode => keybinds.json 
" nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
" xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
" nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
" xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
" nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
" xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
" nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
" xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" Bind C-/ to vscode commentary done in vscode => keybinds.json 
" xnoremap <silent> <Space>cc :call Comment()<CR>
" nnoremap <silent> <Space>c :call Comment()<CR>

nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <silent> <Space>w :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space>w :call VSCodeNotify('whichkey.show')<CR>
