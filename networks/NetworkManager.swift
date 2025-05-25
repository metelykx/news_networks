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
    let URLNews = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e197bdd544c94f95b028cf929b1588b8"
    //MARK: - Initializer
    private init() {}
    
    //MARK: - Methods
    func getNews() async throws -> News{
        
        guard let url = URL(string: URLNews) else {throw NetworkError.invalidURL}
    }
}

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
}
