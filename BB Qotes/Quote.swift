//
//  Quote.swift
//  BB Qotes
//
//  Created by Elisei Bobocea on 29/06/2022.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let series: String
    
    enum QuoteKeys: String, CodingKey {
        case quote
        case author
        case series
    }
    
    init(from decoder: Decoder) throws {
        var continer = try decoder.unkeyedContainer()
        let quoteContainer = try continer.nestedContainer(keyedBy: QuoteKeys.self)
        
        quote = try quoteContainer.decode(String.self, forKey: .quote)
        author = try quoteContainer.decode(String.self, forKey: .author)
        series = try quoteContainer.decode(String.self, forKey: .series)
    }
    
}
