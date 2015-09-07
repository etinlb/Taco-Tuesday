//
//  Card.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/5/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation
import SpriteKit

let firstHalfFlip = SKAction.scaleXTo(0.0, duration: 0.4)
let secondHalfFlip = SKAction.scaleXTo(1.0, duration: 0.4)

class Card : SKSpriteNode {
    
    enum CardName: Int {
        case CreatureWolf = 0,
        CreatureBear,       // 1
        CreatureDragon,     // 2
        Energy,             // 3
        SpellDeathRay,      // 4
        SpellRabid,         // 5
        SpellSleep,         // 6
        SpellStoneskin      // 7
    }
    required init(coder aDecoder: (NSCoder!)) {
        fatalError("NSCoding not supported")
    }
    
    init(cardName: CardName) {
        
        backTexture = SKTexture(imageNamed: "Card Back")
        
        // initailize some shit
        switch cardName {
        case .CreatureWolf:
            frontTexture = SKTexture(imageNamed: "Wolf")
            largeTextureFilename = "Wolf"
            
        case .CreatureBear:
            frontTexture = SKTexture(imageNamed: "Bear")
            largeTextureFilename = "Bear"
        default:
            frontTexture = SKTexture(imageNamed: "Card Back")
            largeTextureFilename = "Card Back"
        }
        
        
        super.init(texture: frontTexture, color: UIColor.blueColor(), size: frontTexture.size())
        
        
        userInteractionEnabled = true
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(scene!)
            let touchedNode = nodeAtPoint(location)
            touchedNode.position = location
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            if touch.tapCount > 1 {
                flip()
            }
            // Move the touched catd forward in the z plane
            self.zPosition = 15
            // animate the card up by scalling up to 1.2 size over .2 seconds
            self.runAction(liftUp, withKey: "pickup")
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            // Move the touched catd back in the z plane
            let location = touch.locationInNode(scene!)
            let touchedNode = nodeAtPoint(location)
            touchedNode.zPosition = 0
            
            // animate the card down to normal size
            touchedNode.runAction(dropDown, withKey: "drop")
        }
    }
    
    func flip() {
        setScale(1.0)
        
        if faceUp {
            runAction(firstHalfFlip) {
                self.texture = self.backTexture
                if let damageLabel = self.childNodeWithName("damageLabel") {
                    damageLabel.hidden = true
                }
                self.faceUp = false
                self.runAction(secondHalfFlip)
            }
        } else {
            runAction(firstHalfFlip) {
                self.texture = self.frontTexture
                if let damageLabel = self.childNodeWithName("damageLabel") {
                    damageLabel.hidden = false
                }
                self.faceUp = true
                self.runAction(secondHalfFlip)
            }
        }
    }
 
    let frontTexture: SKTexture
    let backTexture: SKTexture
    var largeTexture: SKTexture?
    let largeTextureFilename: String
    
    var faceUp = true
    
}