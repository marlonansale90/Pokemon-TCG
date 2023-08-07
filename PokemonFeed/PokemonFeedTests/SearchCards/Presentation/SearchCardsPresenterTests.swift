//
//  SearchCardsPresenterTests.swift
//  PokemonFeedTests
//
//  Created by Marlon Von Bernales Ansale on 07/08/2023.
//

import XCTest
import PokemonFeed

class SearchCardsPresenterTests: XCTestCase {
    
    func test_title_isLocalized() {
        XCTAssertEqual(SearchCardsPresenter.title, localized("DECK_TITLE"))
    }
    
    // MARK: - Helpers
    private func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = "SearchCards"
        let bundle = Bundle(for: SearchCardsPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}
