//
//  FeedItem.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public struct FeedItem: Identifiable, Equatable {
  public let id: String
  public let title: String
  public let content: String
  public let link: URL?
  public let publishDate: Date
  public let author: String?
  public let categories: [String]
  public let media: [FeedMedia]
  public let source: FeedSource

  public init(
    id: String,
    title: String,
    content: String,
    link: URL? = nil,
    publishDate: Date,
    author: String? = nil,
    categories: [String] = [],
    media: [FeedMedia] = [],
    source: FeedSource) {
    self.id = id
    self.title = title
    self.content = content
    self.link = link
    self.publishDate = publishDate
    self.author = author
    self.categories = categories
    self.media = media
    self.source = source
  }
}
