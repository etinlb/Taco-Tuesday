//
//  CustomerCard.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/7/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation
import SpriteKit

// TODO: Should be some sort of constant
let backTextureFile = "Card Back"

class CustomerCard : Card
{    
    init( cardData: CustomerCardData )
    {
        self.cardData = cardData
        let imageFile = cardData.texture
        
        super.init( frontTextureFile: imageFile, backTextureFile: backTextureFile )
        
        // How to permanatly set the size.
        self.size = CGSize( width: self.size.width * 0.5, height: self.size.height * 0.5 )
    }
    
    required init( coder aDecoder: NSCoder )
    {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    static func makeCard( cardData: CardData ) -> Card
    {
        let customerCardData = cardData as! CustomerCardData
        return CustomerCard( cardData: customerCardData )
    }
    
    let cardData : CustomerCardData
    
    // TODO: Learn swift data structures for this shit    
    var meat : Int16 = 0
    var cheese : Int16 = 0
    var produce : Int16 = 0
}

