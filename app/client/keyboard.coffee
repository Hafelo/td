exports.keyDown = (e)->
    switch e.keyCode
        when 39
            exports.right=true
            exports.key='right'
        when 37
            exports.left=true
            exports.key='left'
        when 38
            exports.up=true
            exports.key='up'
        when 40
            exports.down=true
            exports.key='down'
        when 32
            exports.space=true
            exports.key='space'
        when 16
            exports.shift=true
            exports.key='shift'
        when 17
            exports.ctrl=true
            exports.key='ctrl'
        when 18
            exports.alt=true
            exports.key='alt'
        when 13
            exports.enter=true
            exports.key='enter'
        when 8
            exports.backspace=true
            exports.key='backspace'
        when 9
            exports.tab=true
            exports.key='tab'
        else
            exports.other=true
            exports.key='other'
            console.log e.keyCode
    return true #false to capture input and decieve browser
exports.keyUp = (e)->
    switch e.keyCode
        when 39
            exports.right=false
            exports.key=''
        when 37
            exports.left=false
            exports.key=''
        when 38
            exports.up=false
            exports.key=''
        when 40
            exports.down=false
            exports.key=''
        when 32
            exports.space=false
            exports.key=''
        when 16
            exports.shift=false
            exports.key=''
        when 17
            exports.ctrl=false
            exports.key=''
        when 18
            exports.alt=false
            exports.key=''
        when 13
            exports.enter=false
            exports.key=''
        when 8
            exports.backspace=false
            exports.key=''
        when 9
            exports.tab=false
            exports.key=''
        else
            exports.other=false
            exports.key=''
    return true #false to capture input and decieve browser
