//
//  ViewController.swift
//  Concerntration
//
//  Created by Mac on 2018/1/25.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet private var cardButtons: [UIButton]!

    private lazy var game = Concentration( numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int {
            return (cardButtons.count+1) / 2
    }

    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private(set) var flipCount = 0 {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips:\(flipCount)", attributes: attributes)
        
        flipCountLabel.attributedText = attributedString
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber=cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button=cardButtons[index]
            let card=game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
    }
    
   // private var emojiChoices=["🎃","👻","👿","🤖","🐶","🐝","🍎","🌶","🍟"]
    private var emojiChoices="🎃👻👿🤖🐶🐝🍎🌶🍟"
    private var emoji=[Card:String]()
    private func emoji(for card : Card)-> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            let randomStringIndex=emojiChoices.index(emojiChoices.startIndex, offsetBy: randomIndex)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
}

