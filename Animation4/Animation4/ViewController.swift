//
//  ViewController.swift
//  Animation4
//
//  Created by AnhDCT on 8/28/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelTimer: UILabel!
    
    var model = CardModel()
    var arrCard = [Card]()
    var firstFlipedCardIndex : IndexPath?
    var timer : Timer?
    var milliseconds : Float = 10 * 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrCard = model.getCard()
        collectionView.dataSource = self
        collectionView.delegate = self
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
       
    }
    @objc func timerElapsed() {
        milliseconds -= 1
        let seconds = String(format: "%.2f", milliseconds/1000)
        labelTimer.text = "Time Remaining \(seconds)"
        if milliseconds <= 0 {
            timer?.invalidate()
            labelTimer.textColor = .red
        }
        checkGameEnded()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        let card = arrCard[indexPath.row]
        cell.setCard(card: card)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if milliseconds <= 0 {
            return
        }
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let card = arrCard[indexPath.row]
        if card.isFilped == false  && card.isMatched == false{
            cell.flip()
            card.isFilped = true
            
            if firstFlipedCardIndex == nil{
                firstFlipedCardIndex = indexPath
            } else{
                checkForMatches(secondFlipedCardIndex: indexPath)
            }
        }
    }
    func checkForMatches(secondFlipedCardIndex: IndexPath){
        let cardOneCell = collectionView.cellForItem(at: firstFlipedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlipedCardIndex) as? CardCollectionViewCell
        
        let cardOne = arrCard[firstFlipedCardIndex!.row]
        let cardTwo = arrCard[secondFlipedCardIndex.row]
        
        if cardOne.imageName == cardTwo.imageName {
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
        } else{
            
            cardOne.isFilped = false
            cardTwo.isFilped = false
            
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
        if cardOneCell == nil{
            collectionView.reloadItems(at: [firstFlipedCardIndex!])
        }
        firstFlipedCardIndex = nil
    }
    
    func checkGameEnded(){
        var isWon = true
        for card in arrCard{
            if card.isMatched == false{
                isWon = false
                break
            }
        }
        var title = ""
        var message = ""
        if isWon == true{
            if milliseconds > 0 {
                timer?.invalidate()
            }
            title = "Congratulations!"
            message = "You've won"
        } else{
            if milliseconds > 0 {
                return
            }
            title = "Game Over"
            message = "You've lost"
        }
        showAlert(title: title, message: message)
    }
    
    func showAlert(title :String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}

