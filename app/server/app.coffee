players = {}

every = (ms, cb) -> setInterval cb, ms
every 20, -> SS.publish.broadcast 'players', players

SS.events.on 'client:disconnect', (session) ->
    delete players[session.id]

exports.actions =
    init: (cb) ->
        players[@session.id] = new Player()
        cb @session.id
    up: (cb)-> players[@session.id].up()
    down: (cb)-> players[@session.id].down()
    left: (cb)-> players[@session.id].left()
    right: (cb)-> players[@session.id].right()
    collides: (cb)-> players[@session.id].collide()

class Player
    constructor:->
        @team = ['lime','blue','white','red','orange','yellow','purple','brown'][Math.floor Math.random()*8]
        @speed = Math.random()*.05+.001
        @x = Math.random()
        @y = Math.random()
        @w = Math.random()*.3+.001
        @h = Math.random()*.3+.001
        @points = 0
    up:->
        @y -= @speed
        @y = 1 if @y < -@h #go off the top, appear at the bottom
    down:->
        @y += @speed
        @y = -@h if @y > 1 #go off the bottom, appear at the top
    left:->
        @x -= @speed
        @x = 1 if @x < -@w #go off the left, appear at the right
    right:->
        @x += @speed
        @x = -@w if @x > 1 #go off the right, appear at the left
    collides: (players)->
        return false if @x+@w < (player.x) and @x > (player.x + player.w) and @y+@h < (player.y) and @y > (player.y + player.h)
        #right, left, bottom
        return true
        #If not returned false then return true
