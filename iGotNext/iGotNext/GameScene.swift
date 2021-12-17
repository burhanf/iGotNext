//
//  GameScene.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-30.
//

import SpriteKit
import GameplayKit

// step 7 - add Physics categories struct
struct PhysicsCategory{
    static let None : UInt32 = 0
    static let All : UInt32 = UInt32.max
    static let Baddy : UInt32 = 0b1 // 1
    
}

// step 6 - add collision detection delegate
class GameScene: SKScene, SKPhysicsContactDelegate {
    private let images = ["soccericon","basketballicon","volleyballicon","tennisicon","footballicon"]
    var index = Int.random(in: 0..<5)
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0,dy: 0)
        physicsWorld.contactDelegate = self

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addBaddy), SKAction.wait(forDuration: 1)])))
        
        
    }
    
    // step 3 - adding bad guy leafs
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min:CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max-min) + min
    }
    // spawn icons when the metho is invoced
    func addBaddy(){
        // append a random image to the sprite from the list of image strings
        index = Int.random(in: 1..<5)
        let baddy = SKSpriteNode(imageNamed: images[index])
        baddy.zRotation = -9
        baddy.xScale = baddy.xScale * -1
        baddy.size = CGSize(width: 30, height: 30)
        // randomize a spawn location
        let actualX = random(min: baddy.size.width/2, max: size.width-baddy.size.width/2)
        baddy.position = CGPoint(x: actualX, y:size.width*2 + baddy.size.height/2)
        
        addChild(baddy)
        
        // step 9 - add physics to our baddy
        baddy.physicsBody = SKPhysicsBody(rectangleOf: baddy.size)
        baddy.physicsBody?.isDynamic = true
        baddy.physicsBody?.categoryBitMask = PhysicsCategory.Baddy
        baddy.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        // end step 9
        
        let actualDuration = random(min: CGFloat(4.0), max:CGFloat(10))
        
        let actionMove = SKAction.move(to: CGPoint(x: actualX, y: -baddy.size.height/2), duration: TimeInterval(actualDuration))
        
        baddy.run(SKAction.sequence([actionMove]))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
