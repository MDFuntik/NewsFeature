//
//  FetchFeedUseCase.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

// MARK: - FetchFeedUseCase

public protocol FetchFeedUseCase {
  func execute(source: FeedSource) async throws -> Feed
  func execute(sources: [FeedSource]) async -> [Result<Feed, Error>]
}
