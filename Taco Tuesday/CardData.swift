//
//  CardData.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/17/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation

// protocal that specifies creating a card data class from some json
protocol CardData
{
    static func initFromJson( cardData : JSON ) -> CardData
    var texture: String { get }
}