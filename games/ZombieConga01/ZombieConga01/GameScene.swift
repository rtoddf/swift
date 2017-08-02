import SpriteKit

class GameScene: SKScene {
    let zombie = SKSpriteNode(imageNamed: "zombie1")
    var lastUpdateTime: NSTimeInterval = 0
    var dt: NSTimeInterval = 0
    
    let zombieMovePointsPerSecond: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    let playableRect: CGRect
    
    override init(size: CGSize){
        let maxAspectRatio: CGFloat = 16.0/9.0 // 1
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height-playableHeight)/2.0 // 3
        playableRect = CGRect(x: 0, y: playableMargin,
                              width: size.width,
                              height: playableHeight) // 4
        super.init(size: size) // 5
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // 6
    }
    
    // helper function to draw a box
//    func debugDrawPlayableArea() {
//        let shape = SKShapeNode()
//        let path = CGPathCreateMutable()
//        CGPathAddRect(path, nil, playableRect)
//        shape.path = path
//        shape.strokeColor = SKColor.redColor()
//        shape.lineWidth = 4.0
//        addChild(shape)
//    }
    
    override func didMoveToView(view: SKView){
        backgroundColor = SKColor.blackColor()
        
        let background = SKSpriteNode(imageNamed: "background1")
//        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        background.zPosition = -1
        
        let backgroundSize = background.size
        print("size: \(backgroundSize)")
        
        
        zombie.position = CGPoint(x: 400, y: 400)
//        zombie.setScale(2.0)

//        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        background.position = CGPoint(x: size.width/2, y: size.height/2)
//        background.zRotation = CGFloat(M_PI) / 8
        
        addChild(background)
        addChild(zombie)
    }
    
    override func update(currentTime: NSTimeInterval){
        if lastUpdateTime > 0{
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
//        print("\(dt*1000) milliseconds since last update")
        moveSprite(zombie, velocity: velocity)
        
//        zombie.position = CGPoint(x: zombie.position.x + 8, y: zombie.position.y)
        
        boundsCheckZombie()
        rotateSprite(zombie, direction: velocity)
    }
    
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint){
        // 1
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
//        print("Amount to move: \(amountToMove)")
        
        //2
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
    }
    
    func moveZombieToward(location: CGPoint){
        let offset = CGPoint(x: location.x - zombie.position.x, y: location.y - zombie.position.y)

        let length = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
        let direction = CGPoint(x: offset.x / CGFloat(length), y: offset.y / CGFloat(length))
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSecond, y: direction.y * zombieMovePointsPerSecond)
    }
    
    func sceneTouched(touchLocation:CGPoint){
        moveZombieToward(touchLocation)
    }
    
    func boundsCheckZombie(){
//        let bottomLeft = CGPointZero
//        let topRight = CGPoint(x: size.width, y: size.height)
        
        let bottomLeft = CGPoint(x: 0, y: CGRectGetMinY(playableRect))
        let topRight = CGPoint(x: size.width, y: CGRectGetMaxY(playableRect))
        
        if zombie.position.x <= bottomLeft.x {
            zombie.position.x = bottomLeft.x
            velocity.x = -velocity.x
        }
        
        if zombie.position.x >= topRight.x {
            zombie.position.x = topRight.x
            velocity.x = -velocity.x
        }
        
        if zombie.position.y <= bottomLeft.y {
            zombie.position.y = bottomLeft.y
            velocity.y = -velocity.y
        }
        
        if zombie.position.y >= topRight.y {
            zombie.position.y = topRight.y
            velocity.y = -velocity.y
        }
    }
    
    func rotateSprite(sprite: SKSpriteNode, direction: CGPoint){
        sprite.zRotation = CGFloat(atan2(Double(direction.y), Double(direction.x)))
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.locationInNode(self)
        sceneTouched(touchLocation)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.locationInNode(self)
        sceneTouched(touchLocation)
    }
}

//class GameScene: SKScene {
//    override func didMoveToView(view: SKView) {
//        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!"
//        myLabel.fontSize = 45
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
//        
//        self.addChild(myLabel)
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//       /* Called when a touch begins */
//        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
//    }
//   
//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }
//}
