//
//  Card.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/5/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation
import SpriteKit

// TODO: Have a seperate animation class that defines all the 
// scalling relative to a global scale
let firstHalfFlip = SKAction.scaleXTo( 0.0, duration: 0.4 )
let secondHalfFlip = SKAction.scaleXTo( 1.0, duration: 0.4 )

// Simple Scalling Animations
let wiggleIn = SKAction.scaleXTo( 1.0, duration: 0.2 )
let wiggleOut = SKAction.scaleXTo( 1.2, duration: 0.2 )
let wiggle = SKAction.sequence( [wiggleIn, wiggleOut] )
let wiggleRepeat = SKAction.repeatActionForever( wiggle )

let liftUp = SKAction.scaleTo( 1.2, duration: 0.2 )
let dropDown = SKAction.scaleTo( 1.0, duration: 0.2 )

class Card : SKSpriteNode
{
    
    required init( coder aDecoder: (NSCoder!) )
    {
        fatalError( "NSCoding not supported" )
    }
    
    init( frontTextureFile: String, backTextureFile: String )
    {
        backTexture = SKTexture( imageNamed: backTextureFile )
        frontTexture = SKTexture( imageNamed: frontTextureFile )
        
        super.init( texture: frontTexture, color: UIColor.blueColor(), size: frontTexture.size() )
        
        userInteractionEnabled = true
    }
    
    override func touchesMoved( touches: Set<UITouch>, withEvent event: UIEvent? ) {
        for touch in touches {
            let location = touch.locationInNode( scene! )
            self.position = location

//            let point = CGPoint(x: 200, y: 200)
//            if(self.containsPoint(point)){
//                print("in it")
//            }
        }
    }
    
    /* Called when a touch begins */
    override func touchesBegan( touches: Set<UITouch>, withEvent event: UIEvent? ) {

        for touch in touches
        {
            if touch.tapCount > 1
            {
                flip()
            }
            
            // Move the touched card forward in the z plane
            self.zPosition = 15
            
            // animate the card up by scalling up to 1.2 size over .2 seconds
            self.runAction( liftUp, withKey: "pickup" )
        }
    }
    
    override func touchesEnded( touches: Set<UITouch>, withEvent event: UIEvent? )
    {
        for _ in touches
        {
            // Move the touched catd back in the z plane
            self.zPosition = 0
            
            // animate the card down to normal size
            self.runAction( dropDown, withKey: "drop" )
        }
    }
    
    func flip()
    {
        setScale( 1.0 )
        
        if faceUp
        {
            runAction( firstHalfFlip )
            {
                self.texture = self.backTexture
                self.faceUp = false
                
                self.runAction( secondHalfFlip )
            }
        } else {
            runAction( firstHalfFlip )
            {
                self.texture = self.frontTexture
                self.faceUp = true
                
                self.runAction( secondHalfFlip )
            }
        }
    }
 
    let frontTexture: SKTexture
    let backTexture: SKTexture
    var largeTexture: SKTexture?
//    let largeTextureFilename: String
    
    var faceUp = true
    
}