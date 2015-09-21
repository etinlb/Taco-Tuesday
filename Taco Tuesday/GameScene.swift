//
//  GameScene.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/5/15.
//  Copyright (c) 2015 Erik Parreira. All rights reserved.
//

import SpriteKit
import Foundation

class GameScene: SKScene
{
    override func didMoveToView( view: SKView )
    {
        // read json rings
        // TODO: This should return a dictionary or something and call a 
        // Add to scene function
        let game = Game( gameScene: self )

        game.start()
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
//        print(self.size)
    }
}
