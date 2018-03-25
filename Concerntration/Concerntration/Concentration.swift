//
//  Concerntration.swift
//  Concerntration
//
//  Created by Mac on 2018/1/26.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards=[Card]()
    
    private var indexOfOneAndOnlyFaceUpCard:Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    }else{
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index==newValue)
            }
        }
    }
    
    mutating func chooseCard(at index:Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards{
            let card=Card()
            cards+=[card,card]
        }
        
        //todo
        for  i in 0..<numberOfPairsOfCards {
            let tempCard=cards[i]
            let randomCardIndex=Int(arc4random_uniform(UInt32(numberOfPairsOfCards)))
            cards[i]=cards[randomCardIndex]
            cards[randomCardIndex]=tempCard
        }
    }
}

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
