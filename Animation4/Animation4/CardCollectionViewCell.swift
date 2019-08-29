//
//  CardCollectionViewCell.swift
//  Animation4
//
//  Created by AnhDCT on 8/28/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var frontCard: UIImageView!
    @IBOutlet weak var backCard: UIImageView!
    var card : Card?
    func setCard(card:Card) {
        self.card = card
        if card.isMatched == true{
            backCard.alpha = 0
            frontCard.alpha = 0
            return
        } else{
            backCard.alpha = 1
            frontCard.alpha = 1
        }
    
        frontCard.image = UIImage(named: card.imageName)
        if card.isFilped == true{
            UIView.transition(from: backCard, to: frontCard, duration: 0.3, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: frontCard, to: backCard, duration: 0.3, options: [.showHideTransitionViews,.transitionFlipFromRight], completion: nil)
        }
    }
    
    
    func flip() {
        UIView.transition(from: backCard, to: frontCard, duration: 0.3, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    
    
    func flipBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontCard, to: self.backCard, duration: 0.3, options: [.transitionFlipFromRight,.showHideTransitionViews,], completion: nil)
        }
    }
    
    
    func remove(){
        frontCard.alpha = 0
        backCard.alpha = 0
    }
}
