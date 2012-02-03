#This runs first as soon as someone connects to the server
#It tells the game to init(ialize)!
#And then it sets it all up!
exports.init = -> Game.init()

#Classes without mains!
class Player
    #These are variables
    #is like ex: int
    hp: 100
    gold: 10
    team: '0f0'#green
    income: 10
    name: 'anon'
    x: .5
    y: .5
    w: .05
    h: .05
    # @ refers to a class variable
    # @name refers to the class player's name
    # when new Player('name') is called, then @name is automatically set to 'name'
    constructor:(@name)->
    #When a player should draw itself, call this.
    #Players won't actually be drawn when the game is finished, but maybe their stats will be
    draw: (g)->
        Game.g.fillStyle = @team
        Game.relativeFillRect @x,@y,@w,@h
    move: ->
        #SS.client.keyboard knows which keys are up or down
        #When we press up, the y position of this player will move up a distance equal to its height
        @y-=@h if SS.client.keyboard.up
        @y+=@h if SS.client.keyboard.down
        @x-=@w if SS.client.keyboard.left
        @x+=@w if SS.client.keyboard.right
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
class Game #static, no new Game(), everything is Game.property or @property
#Every variable only exists one place, inside Game itself
    @players: []
    @creeps: null
    @towers: null
    @mouseX: .5
    @mouseY: .5
#Get the exact pixel position on the screen from a percentage.
#If screen is 50 pixels wide, then .5 (aka 50%) would be 25 pixels
#This should scale everything so we can be full screen on any device
    @relativeX: (x)-> x * @g.canvas.width
    @relativeY: (y)-> y * @g.canvas.height
    @resize: ->
        Game.g.canvas.width = window.innerWidth
        Game.g.canvas.height = window.innerHeight
    @draw: ->
        #Draw a solid black rectangle over the whole screen to refresh it
        @g.fillStyle = '000'
        @g.fillRect 0,0,@relativeX(1),@relativeY(1)
        #Draw all the players
        player.draw(@g) for player in @players
    @move: ->
        #Allow the players to move themselves
        player.move() for player in @players
    #Fill a rectangle with all percentage values
    @relativeFillRect:(x,y,w,h)->
        x=Game.relativeX x
        y=Game.relativeY y
        w=Game.relativeX w
        h=Game.relativeY h
        @g.fillRect x,y,w,h

    #First funtion to be run
    #Function: bundle of code
    #In java
    #   public void  ____ ()
    #       {
    #
    #       }
    #-> is like { and means there is code comming
    #init is typically called first
    #we will call it later
    @init: ->
        @g = $('canvas')[0].getContext '2d' #2d graphics object, just like java
        window.onresize = @resize
        @resize()
        every 50, => @draw()
        every 50, => @move()
        #Arrray: list of vallues [1, 2, 'asdf', 56.9]
        #this array has 4 values
        #push adds a value to the end of the array
        #pop will take a value away
        #x = [1, 7].pop
        #x =  7 and would have an array of [1
        #new Player creates a new oject of type player
        #name of new player = jakl]
        @players.push new Player 'jakl'

        #document.onmouseup = function(e){}
        #document.onmousedown = function(e){}
        #document.onmousewheel = (e)-> #normalized = -e.wheelDelta/120
        document.onmousemove = (e)=>
            @mouseX = @relativeX e.pageX
            @mouseY = @relativeY e.pageY
    #This will return a random number
    #random: ->
    #    return Math.random()

after = (ms, cb) -> setTimeout cb, ms
every = (ms, cb) -> setInterval cb, ms
