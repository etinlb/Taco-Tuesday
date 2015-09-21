//
//  Game.swift
//  Taco Tuesday
//
//  Created by Erik Parreira on 9/11/15.
//  Copyright © 2015 Erik Parreira. All rights reserved.
//

import Foundation
import SpriteKit

let settingsPath = "cards"

class Game
{
    // All the sizes relative to size of the board
    let handLocation = CGPoint( x: 0.1, y: 0.5 )
    let customerDeck : CGFloat = 0.1
    let foodDeck :     CGFloat = 0.9
    
    let gameScene: SKScene
    
    init( gameScene: SKScene )
    {
        // Temperarliy place cards in the layout
        self.gameScene = gameScene
        
        self.setUp()
    }
    
    func start()
    {
        
    }
    
    func setUp()
    {
        let cardData = readJson( settingsPath )
        let customerDeck = cardData["customer_deck"].array!
        let customerTypes = cardData["customer_types"]

        CustomerCardData.initializeTextureMap( customerTypes )
        let deck = Deck( cardDeck: customerDeck, makeCardData: CustomerCardData.initFromJson,
                         MakeCard: CustomerCard.makeCard )
        
        let customer = deck.drawCard() as! CustomerCard
        
        self.gameScene.addChild( customer )
        customer.position.x = 200
        customer.position.y = 200
        
        deck.position.x = 100
        deck.position.y = 400
        self.gameScene.addChild( deck )
        
        print(customer)
    }
    
    func buildCards( filePath: String )
    {
        
        print( self.gameScene.size )
    }
    
    func setUpBoard()
    {
//        let spawnPoint = self.gameScene.childNodeWithName("CustomerSlots")
//        let customerSlots = spawnPoint!.children

//        for customerSlot in customerSlots {
//            
//        }
    }
    
    func getRandomCustomer()
    {
        
    }
    
    func readJson( filePath: String ) -> JSON
    {
        let fullFilePath = NSBundle.mainBundle().pathForResource( filePath, ofType: "json" )
        var jsonData: NSData?
        
        do {
            let data = try NSData( contentsOfFile:fullFilePath!, options: NSDataReadingOptions.DataReadingUncached )
            jsonData = data
        } catch let error as NSError {
            print( error )
        } catch {
            fatalError()
        }
        
        let json = JSON( data: jsonData! )
        
        return json
    }
}