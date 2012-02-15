players = {}
every = (ms, cb) -> setInterval cb, ms
every 50, -> SS.publish.broadcast 'players', players

exports.actions =
    init: (cb) -> players[@session.id] = new Player() unless players[@session.id]?
    up: (cb)-> players[@session.id].up()
    down: (cb)-> players[@session.id].down()
    left: (cb)-> players[@session.id].left()
    right: (cb)-> players[@session.id].right()

class Player
    constructor:->
        @hp = 100
        @gold = 10
        @team = 'green'
        @income = 10
        @name = 'anon'
        @speed = .01
        @x = .05
        @y = .05
        @w = .05
        @h = .05
    up:->
        @y -= @speed
        @y = 0 if @y < 0
    down:->
        @y += @speed
        @y = 1-@w if @y > 1-@w
    left:->
        @x -= @speed
        @x = 0 if @x < 0
    right:->
        @x += @speed
        @x = 1-@h if @x > 1-@h
    collides: (players)->
        @x is (player.x + player.h)and(player.x - player.h) or @x-@h is (player.x + player.h)and(player.x - player.h) true
        @x is not (player.x + player.h)and(player.x - player.h) or @x-@h is not(player.x + player.h)and(player.x - player.h) false
        @y is (player.y + player.w)and(player.y - player.w) or @y-@w is(player.y + player.w)and(player.y - player.w) true
        @y is not (player.y + player.w)and(player.y - player.w) or @y-@w is not(player.y + player.w)and(player.y - player.w) false
