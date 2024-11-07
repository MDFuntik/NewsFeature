//
//  DefaultFeedValidator.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import RSSKitDomain
import Foundation

public struct DefaultFeedValidator: FeedValidator {
  private let logger: Logger

  public init(logger: Logger = Logger(subsystem: "dev.nsfuntik.rsskit", category: "Validator")) {
    self.logger = logger
  }

  public func validate(_ feed: Feed) throws {
    logger.debug("Validating feed: \(feed.title)")

    guard !feed.title.isEmpty else {
      throw FeedError.validationError("Feed title cannot be empty")
    }

    guard !feed.items.isEmpty else {
      throw FeedError.validationError("Feed must contain at least one item")
    }

    for item in feed.items {
      try validateItem(item)
    }

    logger.debug("Feed validation successful")
  }

  public func validateItem(_ item: FeedItem) throws {
    guard !item.title.isEmpty else {
      throw FeedError.validationError("Item title cannot be empty")
    }

    guard !item.content.isEmpty else {
      throw FeedError.validationError("Item content cannot be empty")
    }

    if let link = item.link {
      guard UIApplication.shared.canOpenURL(link) else {
        throw FeedError.validationError("Invalid item link: \(link)")
      }
    }

    for media in item.media {
      guard UIApplication.shared.canOpenURL(media.url) else {
        throw FeedError.validationError("Invalid media URL: \(media.url)")
      }
    }
  }
}
