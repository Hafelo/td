#When a key is pressed down we grab the keyboard event in e
exports.keyDown = (e)->
    exports.keyDown=true
    #Set different properties based on the key pressed
    #These can be accessed by any other class with SS.client.keyboard.PROPERTY
    switch e.keyCode
        when 39
            exports.right=true
        when 37
            exports.left=true
        when 38
            exports.up=true
        when 40
            exports.down=true
        when 32
            exports.space=true
        when 16
            exports.shift=true
        when 17
            exports.ctrl=true
        when 18
            exports.alt=true
        when 13
            exports.enter=true
        when 8
            exports.backspace=true
        when 9
            exports.tab=true
        else
            exports.other=true
            console.log e.keyCode
    return true #false to capture input and decieve browser

exports.keyUp = (e)->
    exports.keyUp=true
    switch e.keyCode
        when 39
            exports.right=false
        when 37
            exports.left=false
        when 38
            exports.up=false
        when 40
            exports.down=false
        when 32
            exports.space=false
        when 16
            exports.shift=false
        when 17
            exports.ctrl=false
        when 18
            exports.alt=false
        when 13
            exports.enter=false
        when 8
            exports.backspace=false
        when 9
            exports.tab=false
        else
            exports.other=false
    return true #false to capture input and decieve browser
