//
//  Feed.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public struct Feed: Equatable, Identifiable {
  public let id: String
  public let title: String
  public let description: String?
  public let link: URL
  public let language: String?
  public let copyright: String?
  public let lastUpdated: Date?
  public let items: [FeedItem]
  public let configuration: FeedConfiguration

  public init(id: String,
              title: String,
              description: String?,
              link: URL,
              language: String? = nil,
              copyright: String? = nil,
              lastUpdated: Date? = nil,
              items: [FeedItem],
              configuration: FeedConfiguration = FeedConfiguration()) {
    self.id = id
    self.title = title
    self.description = description
    self.link = link
    self.language = language
    self.copyright = copyright
    self.lastUpdated = lastUpdated
    self.items = items
    self.configuration = configuration
  }
}
