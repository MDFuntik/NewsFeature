//
//  NetworkService.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol NetworkService {
  func fetch(_ request: URLRequest) async throws -> (Data, URLResponse)
  func fetchWithRetry(_ request: URLRequest, maxAttempts: Int) async throws -> (Data, URLResponse)
}
