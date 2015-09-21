//
//  GameBoard.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/11/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation
import SpriteKit

// Class for placing cards
class GameBoard
{
    
    init( customerSlots : [SKNode], handCenter : SKNode )
    {
        self.customerSlots = customerSlots
        self.handCenter = handCenter
    }
    
    var customerSlots = [SKNode]()
    var handCenter : SKNode
//    var customerDeck;
//    var customerSlots = [SKNode]()
//    var customerSlots = [SKNode]()

}