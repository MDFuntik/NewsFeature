// swift-tools-version:5.10
import PackageDescription

let package = Package(
  name: "NewsFeature",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
  ],
  products: [
    .library(
      name: "NewsFeature",
      targets: [
        "NewsDomain",
        "NewsData",
        "NewsPresentation",
        "NewsInfrastructure",

      ]),
    .library(
      name: "RSSKit",
      targets: [
        "RSSKitDomain",
        "RSSKitData",
        "RSSKitInfrastructure",
      ]),
  ],
  dependencies: [
    .package(url: "https://github.com/NSFuntik/SwiftToolkit.git", from: "1.0.0"),
  ],
  targets: [
    // MARK: - RSSKit Modules

    .target(
      name: "RSSKitData",
      dependencies: ["RSSKitDomain"],
      path: "Sources/RSSKit/Data",
      sources: [
        "Builders",
        "DTOs",
        "Extensions",
        "Parsers",
        "Validation",
      ]),
    .target(
      name: "RSSKitDomain",
      dependencies: [],
      path: "Sources/RSSKit/Domain",
      sources: [
        "Entities",
        "Errors",
        "Interfaces",
        "UseCases",
      ]),
    .target(
      name: "RSSKitInfrastructure",
      dependencies: [
        "RSSKitDomain",
        "RSSKitData",
      ],
      path: "Sources/RSSKit/Infrastructure",
      sources: [
        "Cache",
        "Monitoring",
        "Network",
        "Service",
        "Storage",
      ]),

    // MARK: - News Feature Modules

    .target(
      name: "NewsPresentation",
      dependencies: [
        "NewsDomain",
        "NewsInfrastructure",
        .product(name: "DI", package: "SwiftToolkit"),
        .product(name: "Coordinator", package: "SwiftToolkit"),
      ]),

    .target(
      name: "NewsInfrastructure",
      dependencies: [
        "NewsDomain",
        "NewsData",
        "RSSKitDomain",
        "RSSKitInfrastructure",
      ]),

    .target(
      name: "NewsData",
      dependencies: ["NewsDomain"]),

    .target(
      name: "NewsDomain"),

    // MARK: - Test Targets

    .testTarget(
      name: "RSSKitDomainTests",
      dependencies: ["RSSKitDomain"]),

    .testTarget(
      name: "RSSKitDataTests",
      dependencies: ["RSSKitData"]),

    .testTarget(
      name: "RSSKitInfrastructureTests",
      dependencies: ["RSSKitInfrastructure"]),

    .testTarget(
      name: "NewsDomainTests",
      dependencies: ["NewsDomain"]),

    .testTarget(
      name: "NewsDataTests",
      dependencies: ["NewsData"]),

    .testTarget(
      name: "NewsPresentationTests",
      dependencies: ["NewsPresentation"]),

    .testTarget(
      name: "NewsInfrastructureTests",
      dependencies: ["NewsInfrastructure"]),
  ])
