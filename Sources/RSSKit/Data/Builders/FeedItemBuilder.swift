//
//  FeedItemBuilder.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation
import RSSKitDomain

final class FeedItemBuilder {
  private let source: FeedSource
  private var title: String = ""
  private var content: String = ""
  private var link: URL?
  private var publishDate: Date = .init()
  private var author: String?
  private var categories: [String] = []
  private var media: [FeedMedia] = []

  init(source: FeedSource) {
    self.source = source
  }

  func setTitle(_ title: String) {
    self.title = title
  }

  func appendContent(_ content: String) {
    self.content += content
  }

  func setLink(_ link: URL?) {
    self.link = link
  }

  func setPublishDate(_ date: Date) {
    self.publishDate = date
  }

  func setAuthor(_ author: String) {
    self.author = author
  }

  func addCategory(_ category: String) {
    categories.append(category)
  }

  func addMedia(_ media: FeedMedia) {
    self.media.append(media)
  }

  func build() -> FeedItem {
    FeedItem(
      id: UUID().uuidString,
      title: title,
      content: content,
      link: link,
      publishDate: publishDate,
      author: author,
      categories: categories,
      media: media,
      source: source)
  }
}
