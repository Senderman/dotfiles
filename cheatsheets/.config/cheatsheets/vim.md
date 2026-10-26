# Useful ViM keybinds I forget sometimes but should use

## Navigation

| Key                  | Description                                                                   |
| -------------------- | ----------------------------------------------------------------------------- |
| H M L                | move cursor top/middle/bottom of the screen                                   |
| %                    | move cursor to matching character (default supported pairs: '()', '{}', '[]') |
| ^ or I               | jump to the first non-blank character of the line                             |
| g_                   | jump to the last  non-blank character of the line                             |
| 5gg 5G :5            | jump to line 5                                                                |
| zt zz zb             | move the screen so the cursor would be on top/middle/bottom of it             |
| Ctrl+e          <br> | move screen (not cursor) down one line                                        |
| Ctrl+y          <br> | move screen (not cursor) up one line                                          |
| Ctrl+b               | pgUp                                                                          |
| Ctrl+f               | pgDown                                                                        |

## Open insert mode

| Key      | Definition                                      |
| -------- | ----------------------------------------------- |
| o        | append (open) a new line below the current line |
| O        | append (open) a new line above the current line |

## Editing

| Key    | Definition                                                      |
| ------ | --------------------------------------------------------------- |
| .        | repeat the last command                                       |
| Ctrl+n/p | next/previous item in the autocompletion menu                 |
| Ctrl+j   | add a line break at the current cursor position               |
| gu       | lowercase from the cursor to motion (0/$/w/e/etc)             |
| gU       | uppercase from the cursor to motion (0/$/w/e/etc)             |
| R        | replace more than one character, until ESC is pressed         |
| J        | join  line below to the current one with one space in between |
| gJ       | Join  line below to THe current one without  space in between |
| Ctrl+t   | add indent (Insert mode)                                      |
| Ctrl+d   | unindent (Insert mode)                                        |
| >>       | add indent (Normal mode)                                      |
| <<       | unindent (Normal mode)                                        |


## Visual mode

| Key | Definition                       |
| --- | -------------------------------- |
| ~   | toggle case of the selected text |
| u   | lowercase selected text          |
| U   | uppercase selected text          |
 
## Marks

| Key                | Definition                                         |
| ------------------ | -------------------------------------------------- |
| :marks             | list of marks                                      |
| :delmarks a        | delete mark a                                      |
| ma            <br> | set current position for mark A                    |
| 'a                 | jump to position of mark A                         |
| '0                 | go to the position where Vim was previously exited |

## Bulk line edit

| Key             | Definition                                                                           |
| --------------- | ------------------------------------------------------------------------------------ |
| :3,5d           | delete lines starting from 3 to 5. Use . for the current line, $ for the end of text |
| :g/{pattern}/d  | delete all lines containing pattern                                                  |
| :g!/{pattern}/d | delete all lines not containing pattern                                              |


# FLAGS

| Key                                      | Definition                           |
| ---------------------------------------- | ------------------------------------ |
| g                                        | apply to all occurrences in the line |
| c                                        | confirm every operation              |
| :%/{pattern}/replacement/FLAG       <br> | replace in current line              |
| :%s/{pattern}/replacement/FLAGS          | replace in file                      |
| :3,5s/{pattern}/replacement/FLAGS        | replace in lines from 3 to 5         |
| D                                        | delete (cut) to the end of the line  |

## Windows and buffers

| Key           | Definition                                         |
| ------------- | -------------------------------------------------- |
| :e filename   | open file in a new buffer                          |
| :ls           | list buffers                                       |
| :bn           | buffer next (NvChad - tab)                         |
| :bp           | buffer previous (NvChad - Shift+Tab)               |
| :bd           | buffer delete (close file)                         |
| Ctrl+ h/j/k/l | focus window (NvChad). Native vim - Ctrl+w h/j/k/l |
| Ctrl+w s      | split window horizontally                          |
| Ctrl+w v      | split window vertically                            |
| Ctrl+w q      | close window                                       |




