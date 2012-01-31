exports.init = ->
    alert 'hi'
    g = $('canvas').getContext '2d'
    g.width window.innerWidth
    g.height window.innerHeight - 96
    g.fillStyle = '#fff'
    g.fillText 'Hello World!', g.canvas.width/2, g.canvas.height/2
#Classes without mains!
class Player
    #These are variables
    #is like ex: int
    hp: 100
    gold: 10
    team: null
    income: 10
    name: null
    # @ refers to a class variable
    # @name refers to the class player's name
    constructor:(@name)->

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
class Game:
    players: null
    creeps: null
    towers: null

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
    #init: ->
        #Arrray: list of vallues [1, 2, 'asdf', 56.9]
        #this array has 4 values
        #players = []
        #push adds a value to the end of the array
        #pop will take a value away
        #x = [1, 7].pop
        #x =  7 and would have an array of [1
        #new Player creates a new oject of type player
        #name of new player = jakl]
        #players.push new Player('jakl')
    #This will return a random number
    #random: ->
    #    return Math.random()
