//
//  GameScene.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/5/15.
//  Copyright (c) 2015 Erik Parreira. All rights reserved.
//

import SpriteKit
import Foundation

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
        
        let wolf = Card(cardName: Card.CardName.CreatureWolf)
        wolf.position = CGPointMake(100,200)
        addChild(wolf)
        

        let bear = Card(cardName: .CreatureBear)
        bear.position = CGPointMake(300, 200)
        addChild(bear)
        
        // Add damage labels
        wolf.addChild(newDamageLabel())
        bear.addChild(newDamageLabel())
    }
    
    func newDamageLabel() -> SKLabelNode {
        
        let damageLabel = SKLabelNode(fontNamed: "Arial")
        damageLabel.name = "damageLabel"
        damageLabel.fontSize = 12
        damageLabel.fontColor = UIColor(red: 0.46, green: 0.0, blue: 0.0, alpha: 1.0)
        damageLabel.text = "0"
        damageLabel.position = CGPoint(x: 25, y: 40)
        
        return damageLabel
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    }
    }
}
