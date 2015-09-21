//
//  Deck.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/16/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation
import Darwin
import SpriteKit

let deckTexture = SKTexture( imageNamed: "Card Back" )


// Class that keeps track of a type of deck. 
// Should take a list of types of cards to have, along with distributions of each card type
// Their should be a draw function that draws a card at random.
class Deck : SKSpriteNode
{
    // Read the deck
    init ( cardDeck : [JSON], makeCardData : (JSON) -> (CardData), MakeCard: (CardData) -> (Card) )
    {
        cardCreator = MakeCard
        self.cards = [CardData]()
        
        for card in cardDeck
        {
            let cardData = makeCardData( card )
            self.cards.append( cardData )
        }
        
        super.init( texture: deckTexture, color: UIColor.blueColor(), size: deckTexture.size() )
    }
    
    func drawCard() -> ( Card )
    {
        let drawIndex = Int( arc4random_uniform(UInt32(cards.count)) )
        let card = self.cardCreator( self.cards[drawIndex] )
        
        return card
    }
    
    required init?( coder aDecoder: NSCoder )
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cards : [CardData]
    let cardCreator: (CardData) -> (Card)
}