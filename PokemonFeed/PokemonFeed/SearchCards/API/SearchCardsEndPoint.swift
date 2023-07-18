//
//  SearchCardsEndPoint.swift
//  PokemonFeed
//
//  Created by Marlon Von Bernales Ansale on 18/07/2023.
//

import Foundation

public enum SearchCardsEndPoint {
    private static let pageSize: Int = 50
 
    case search(search:String)

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .search(search):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/v2/sets"
            components.queryItems = [
                URLQueryItem(name: "pageSize", value: "\(SearchCardsEndPoint.pageSize)"),
                URLQueryItem(name: "name", value: "\(search)")
            ]
            
            return components.url!
        }
    }
}
