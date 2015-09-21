//
//  CustomerData.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/20/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation

var customerTextureMap = Dictionary<String, String>()

let cheeseKey = "cheese"
let meatKey = "meat"
let produceKey = "produce"
let scoreKey = "score"
let foodKey = "food"
let typeKey = "type"

// holds the data for a customer card
class CustomerCardData : CardData
{
    required init( cheeseNeeded: Int16,
                   meatNeeded: Int16,
                   produceNeeded: Int16,
                   scoreAdded: Int16,
                   textureName: String )
    {
//        if( customerTextureMap.isEmpty )
//        {
//            throw CardCreationError.TextureMapNotIntialized
//        }
        
        self.cheeseNeeded = cheeseNeeded
        self.meatNeeded = meatNeeded
        self.produceNeeded = produceNeeded
        self.scoreAdded = scoreAdded
        self.texture = textureName;
    }
    
    static func initFromJson( cardData : JSON ) -> CardData
    {
        let foodData      = cardData[foodKey]
        let cheeseNeeded  = foodData[cheeseKey].int16!
        let meatNeeded    = foodData[meatKey].int16!
        let produceNeeded = foodData[produceKey].int16!
        let scoreAdded    = cardData[scoreKey].int16!
        let type          = cardData[typeKey].string!
        let texture       = customerTextureMap[type]!
        
        let customerData : CustomerCardData

        customerData = CustomerCardData( cheeseNeeded: cheeseNeeded, meatNeeded: meatNeeded,
                                         produceNeeded: produceNeeded, scoreAdded: scoreAdded, textureName: texture )
        
        return customerData
    }
    
    static func initializeTextureMap( textureData : JSON )
    {
        let data = textureData.dictionary!
        
        for ( customerType, textureJson ) in data {
            customerTextureMap[customerType] = textureJson["image"].string!
        }
    }
    
    let cheeseNeeded : Int16
    let meatNeeded : Int16
    let produceNeeded : Int16
    let scoreAdded : Int16
    let texture : String
//    let scoreMultiplier : Int16
}