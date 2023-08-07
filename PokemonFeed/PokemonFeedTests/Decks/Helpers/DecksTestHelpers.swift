//
//  DecksTestHelpers.swift
//  PokemonFeedTests
//
//  Created by Marlon Ansale on 2/3/23.
//

import Foundation
import PokemonFeed

func uniqueDeck(id:String = "", name: String = "Test Deck", update: Date = Date(), cards:[SaveCard] = []) -> Deck {
     Deck(
        id: id,
        name: name,
        update: update,
        cards: cards
     )
}
