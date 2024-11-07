//
//  FeedBuilder.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation
import RSSKitDomain

final class FeedBuilder {
  private let source: FeedSource
  private var title: String = ""
  private var description: String?
  private var link: URL?
  private var language: String?
  private var copyright: String?
  private var lastUpdated: Date?
  private var items: [FeedItem] = []

  init(source: FeedSource) {
    self.source = source
  }

  func setTitle(_ title: String) {
    self.title = title
  }

  func setDescription(_ description: String) {
    self.description = description
  }

  func setLink(_ link: URL) {
    self.link = link
  }

  func setLanguage(_ language: String) {
    self.language = language
  }

  func setCopyright(_ copyright: String) {
    self.copyright = copyright
  }

  func setLastUpdated(_ date: Date) {
    self.lastUpdated = date
  }

  func addItem(_ item: FeedItem) {
    items.append(item)
  }

  func build() -> Feed? {
    guard let link = link else { return nil }

    return Feed(
      id: source.id,
      title: title,
      description: description,
      link: link,
      language: language,
      copyright: copyright,
      lastUpdated: lastUpdated,
      items: items,
      configuration: source.configuration)
  }
}
