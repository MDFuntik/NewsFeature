//
//  FeedError.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public enum FeedError: LocalizedError {
  case invalidData
  case unsupportedFormat(FeedFormat)
  case parsingFailed(Error)
  case networkError(Error)
  case validationError(String)
  case cacheError(Error)
  case backgroundTaskError(Error)

  public var errorDescription: String? {
    switch self {
    case .invalidData:
      return "The feed data is invalid or corrupted"
    case let .unsupportedFormat(format):
      return "Unsupported feed format: \(format)"
    case let .parsingFailed(error):
      return "Failed to parse feed: \(error.localizedDescription)"
    case let .networkError(error):
      return "Network error: \(error.localizedDescription)"
    case let .validationError(message):
      return "Validation error: \(message)"
    case let .cacheError(error):
      return "Cache error: \(error.localizedDescription)"
    case let .backgroundTaskError(error):
      return "Background task error: \(error.localizedDescription)"
    }
  }
}
