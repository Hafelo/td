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
    color: (team, cb)-> players[@session.id].team = team

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
        return true if @x > (player.x + player.h)and @x < (player.x - player.h) or @x-@h < (player.x + player.h)and @x > (player.x - player.h)
        return false if @x < (player.x + player.h)and @x > (player.x - player.h) or @x-@h > (player.x + player.h)and @x < (player.x - player.h)
        return true if @y > (player.y + player.w)and @y < (player.y - player.w) or @y-@w < (player.y + player.w)and @y > (player.y - player.w)
        return false if @y < (player.y + player.w)and @y > (player.y - player.w) or @y-@w > (player.y + player.w)and @y < (player.y - player.w)
