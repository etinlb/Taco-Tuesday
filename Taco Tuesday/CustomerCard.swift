//
//  CustomerCard.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/7/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation

class CustomerCard : Card {
    func makeCardFromJson(cardData: JSON) {
        
    }
    
    init(cardData: JSON) {
        self.score = cardData["score"].int16!
        let food = cardData["food"]
        
        self.meatNeeded = food["meat"] ? food["meat"].int16! : 0
        self.cheeseNeeded = food["cheese"] ? food["cheese"].int16! : 0
        self.produceNeeded = food["produce"] ? food["produce"].int16! : 0
        
        super.init(cardName: .CreatureWolf)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var score: Int16
    
    // TODO: Learn swift data structures for this shit
    var meatNeeded: Int16
    var cheeseNeeded: Int16
    var produceNeeded: Int16
    
    var meat: Int16 = 0
    var cheese: Int16 = 0
    var produce: Int16 = 0
}

