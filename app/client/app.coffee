exports.init = -> Game.init()

Game =
#Get the exact pixel position on the screen from a percentage.
#If screen is 50 pixels wide, then .5 (aka 50%) would be 25 pixels
#This should scale everything so we can be full screen on any device
    relativeX: (x)-> x * @g.canvas.width
    relativeY: (y)-> y * @g.canvas.height
    resize: ->
        Game.g.canvas.width = window.innerWidth
        Game.g.canvas.height = window.innerHeight
    draw: ->
        #Draw a solid black rectangle over the whole screen to refresh it
        @g.fillStyle = '000'
        @g.fillRect 0,0,@relativeX(1),@relativeY(1)
        #Draw all the players
        for key of @players
            player = @players[key]
            @g.fillStyle = player.team
            @relativeFillRect player.x,player.y,player.w,player.h
    move: ->
        if SS.client.keyboard.up
            SS.server.app.up()
        if SS.client.keyboard.down
            SS.server.app.down()
        if SS.client.keyboard.left
            SS.server.app.left()
        if SS.client.keyboard.right
            SS.server.app.right()
    #Fill a rectangle with all percentage values
    relativeFillRect:(x,y,w,h)->
        x=Game.relativeX x
        y=Game.relativeY y
        w=Game.relativeX w
        h=Game.relativeY h
        @g.fillRect x,y,w,h
    init: ->
        SS.server.app.init (id)=>
            @id = id
        SS.events.on 'players', (players) => @players = players

        @g = $('canvas')[0].getContext '2d' #2d graphics object, just like java
        window.onresize = @resize
        @resize()
        every 20, => @draw()
        every 20, => @move()

after = (ms, cb) -> setTimeout cb, ms
every = (ms, cb) -> setInterval cb, ms
