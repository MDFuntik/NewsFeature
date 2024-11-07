//
//  FeedFormat.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

/// Feed format enumeration
/// - rss2: RSS 2.0
/// - atom: Atom 1.0
/// - rdf: RDF
/// - json: JSON Feed
/// - Note: Only rss2 feed supported by the current implementation
///
public enum FeedFormat: String, Codable {
  case rss2
  case atom
  case rdf
  case json

  var contentType: String {
    switch self {
    case .rss2, .atom, .rdf: return "application/xml"
    case .json: return "application/json"
    }
  }
}
