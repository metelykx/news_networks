//
//  NerworkManager.swift
//  networks
//
//  Created by Denis Ivaschenko on 24.05.2025.
//

import Foundation

final class NetworkManager {
    
    //MARK: - Proporties
    static let shared = NetworkManager()
    private let URLNews = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e197bdd544c94f95b028cf929b1588b8"
    private let decoder = JSONDecoder()
    
    //MARK: - Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    //MARK: - Methods
    func getNews() async throws -> News{
        
        guard let url = URL(string: URLNews) else {throw NetworkError.invalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse}
        
        do {
            return try decoder.decode(News.self, from: data)
        }
        catch {
            throw NetworkError.InvalidData
        }
    }
}

