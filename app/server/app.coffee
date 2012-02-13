# Server-side Code
players = {}
testPlayer = 0
every = (ms, cb) -> setInterval cb, ms
every 1000, ->
    if testPlayer
        player = players[testPlayer]
        console.log player.team
        console.log player.x
        console.log player.y


exports.actions =
    init: (cb) ->
        players[@session.id] = new Player()
        players[@session.id].hp = 100
        players[@session.id].gold = 10
        players[@session.id].team = 'green'
        players[@session.id].income = 10
        players[@session.id].name = 'anon'
        players[@session.id].speed = .01
        players[@session.id].x = .05
        players[@session.id].y = .05
        players[@session.id].w = .05
        players[@session.id].h = .05
        testPlayer = @session.id
    moveUp: (cb)-> players[@session.id].y -= players[@session.id].speed
    moveDown: (cb)-> players[@session.id].y += players[@session.id].speed
    moveLeft: (cb)-> players[@session.id].x -= players[@session.id].speed
    moveRight: (cb)-> players[@session.id].x += players[@session.id].speed

#Classes without mains!
class Player
    #These are variables
    #is like ex: int
    hp: 100
    gold: 10
    team: 'green'
    income: 10
    name: 'anon'
    speed: .01
    x: .05
    y: .05
    w: .05
    h: .05





###
class Creeps
    hp: null
    power: null
    color: null
    team: null
    wp: null #Way points
class Towers
    power: null
    team: null
    range: null
###
