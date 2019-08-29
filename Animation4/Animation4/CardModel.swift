//
//  CardModel.swift
//  Animation4
//
//  Created by AnhDCT on 8/28/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import Foundation
class CardModel {
    func getCard() -> [Card] {
        var generatedCardArray = [Card]()
        for _ in 1...6{
            let randomNumber = arc4random_uniform(6) + 1
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardArray.append(cardTwo)
        }
        return generatedCardArray
    }
}
