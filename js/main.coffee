# We create our only state, called 'mainState'
mainState =
  preload: ->
    game.load.image "player", "assets/star.png"
  
  create: ->
    game.stage.backgroundColor = "#3498db"
    game.physics.startSystem Phaser.Physics.ARCADE

    @player = game.add.sprite(game.world.centerX, game.world.centerY, 'player')
    @player.anchor.setTo 0.5, 0.5

    game.physics.arcade.enable @player
    #@player.body.gravity.y = 500

    @cursor = game.input.keyboard.createCursorKeys()

  update: ->
    @movePlayer()
  
  movePlayer: ->
    if @cursor.left.isDown then this.player.body.velocity.x = -200
    else if @cursor.right.isDown then @player.body.velocity.x = 200
    else if @cursor.up.isDown then @player.body.velocity.y = 200
    else if @cursor.down.isDown then @player.body.velocity.y = -200
    else this.player.body.velocity.x = 0

    if @cursor.up.isDown and @player.body.touching.isDown
      @player.body.velocity.y = -320



# Create a 500px by 340px game in the 'gameDiv' element of the index.html
game = new Phaser.Game(500, 340, Phaser.AUTO, "gameDiv")

# Add the 'mainState' to Phaser, and call it 'main'
game.state.add "main", mainState
game.state.start "main"