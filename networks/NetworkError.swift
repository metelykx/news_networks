//
//  NetworkError.swift
//  networks
//
//  Created by Denis Ivaschenko on 25.05.2025.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid response"
    case InvalidData = "Invalid Data"
}
