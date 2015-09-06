//
//  GameScene.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/5/15.
//  Copyright (c) 2015 Erik Parreira. All rights reserved.
//

import SpriteKit


// Simple Scalling Animations
let wiggleIn = SKAction.scaleXTo(1.0, duration: 0.2)
let wiggleOut = SKAction.scaleXTo(1.2, duration: 0.2)
let wiggle = SKAction.sequence([wiggleIn, wiggleOut])
let wiggleRepeat = SKAction.repeatActionForever(wiggle)

let liftUp = SKAction.scaleTo(1.2, duration: 0.2)
let dropDown = SKAction.scaleTo(1.0, duration: 0.2)

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        print("made it here")
        
        let wolf = Card(imageNamed: "Wolf")
        wolf.position = CGPointMake(100,200)
        addChild(wolf)
        
        let bear = Card(imageNamed: "Bear")
        bear.position = CGPointMake(300, 200)
        addChild(bear)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.position = location
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        for touch in touches {
            // Move the touched catd forward in the z plane
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.zPosition = 15
            
            // animate the card up by scalling up to 1.2 size over .2 seconds
            touchedNode.runAction(liftUp)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            // Move the touched catd back in the z plane
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.zPosition = 0
            
            // animate the card down to normal size
            touchedNode.runAction(dropDown)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
