//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Ibrahim Farajzade on 7/11/20.
//  Copyright © 2020 Ibrahim Farajzade. All rights reserved.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published var model = SetGame()
    @Published var wasMatch: SetGame.State = .selectCard
    
    // MARK: - Access to Model
    var cards: [SetGame.Card] {
        model.dealedCards
    }
    
    var cardsRemaining: Int {
        model.cardsRemainingInDeck
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    func choose(_ card: SetGame.Card) {
        wasMatch = model.select(card: card)
    }
    
    func drawCard(_ number: Int = 1) {
        for _ in 0..<number {
            _ = model.addCard()
        }
    }
    
    func dealMoreCard() {
        drawCard(3)
    }
    
    func newGame() {
        model = SetGame()
        drawCard(12)
    }
}
