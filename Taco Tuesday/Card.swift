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
let firstHalfFlip = SKAction.scaleX( to: 0.0, duration: 0.4 )
let secondHalfFlip = SKAction.scaleX( to: 1.0, duration: 0.4 )

// Simple Scalling Animations
let wiggleIn = SKAction.scaleX( to: 1.0, duration: 0.2 )
let wiggleOut = SKAction.scaleX( to: 1.2, duration: 0.2 )
let wiggle = SKAction.sequence( [wiggleIn, wiggleOut] )
let wiggleRepeat = SKAction.repeatForever( wiggle )

let liftUp = SKAction.scale( to: 1.2, duration: 0.2 )
let dropDown = SKAction.scale( to: 1.0, duration: 0.2 )

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
        
        super.init( texture: frontTexture, color: UIColor.blue, size: frontTexture.size() )
        
        isUserInteractionEnabled = true
    }
    
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent? ) {
        for touch in touches {
            let location = touch.location( in: scene! )
            self.position = location

//            let point = CGPoint(x: 200, y: 200)
//            if(self.containsPoint(point)){
//                print("in it")
//            }
        }
    }
    
    /* Called when a touch begins */
    override func touchesBegan( _ touches: Set<UITouch>, with event: UIEvent? ) {

        for touch in touches
        {
            if touch.tapCount > 1
            {
                flip()
            }
            
            // Move the touched card forward in the z plane
            self.zPosition = 15
            
            // animate the card up by scalling up to 1.2 size over .2 seconds
            self.run( liftUp, withKey: "pickup" )
        }
    }
    
    override func touchesEnded( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        for _ in touches
        {
            // Move the touched catd back in the z plane
            self.zPosition = 0
            
            // animate the card down to normal size
            self.run( dropDown, withKey: "drop" )
        }
    }
    
    func flip()
    {
        setScale( 1.0 )
        
        if faceUp
        {
            run( firstHalfFlip, completion: {
                self.texture = self.backTexture
                self.faceUp = false
                
                self.run( secondHalfFlip )
            } )
            
        } else {
            run( firstHalfFlip, completion: {
                self.texture = self.frontTexture
                self.faceUp = true
                
                self.run( secondHalfFlip )
            } )
            
        }
    }
 
    let frontTexture: SKTexture
    let backTexture: SKTexture
    var largeTexture: SKTexture?
//    let largeTextureFilename: String
    
    var faceUp = true
    
}
