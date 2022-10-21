//
//  FetchController.swift
//  BB Qotes
//
//  Created by Elisei Bobocea on 29/06/2022.
//

import Foundation

struct FetchController {
    enum NetworkError: Error{
        case badURL, badResponse
    }
    
    private let baseURL = URL(string: "https://www.breakingbadapi.com/api/")!
    
    func fetchQuote() async throws -> Quote {
        let quoteURL = baseURL.appendingPathComponent("quote/random")
        
        let (data, response) = try await URLSession.shared.data(from: quoteURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        print(String(data: data, encoding: .utf8) ?? "Error")
        let quotes = try JSONDecoder().decode([Quote].self, from: data)
        
        return quotes[0]
    }
    
    func fetchCharacter(name: String) async throws -> Character {
        let characterURL = baseURL.appendingPathComponent("characters")
        var characterComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
        let characterQueryItem = URLQueryItem(name: "name", value: name)
        characterComponents?.queryItems = [characterQueryItem]
        
        guard let searchURL = characterComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: searchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let characters = try JSONDecoder().decode([Character].self, from: data)
        
        return characters[0]
    }
}
