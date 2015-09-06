//
//  Card.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/5/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation
import SpriteKit

class Card : SKSpriteNode {
    
    required init(coder aDecoder: (NSCoder!)) {
        fatalError("NSCoding not supported")
    }
    
    init(imageNamed: String) {
        let cardTexture = SKTexture(imageNamed: imageNamed)
        super.init(texture: cardTexture, color: UIColor.blueColor(), size: cardTexture.size())
    }
}