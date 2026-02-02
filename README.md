# MTGJsonClasses

Swift models/DTOs for decoding MTGJSON data and related TCGPlayer payloads. Works across Apple platforms via Swift Package Manager.

[![Tests](https://github.com/jmcsmith/MTGJsonClasses/actions/workflows/swift.yml/badge.svg)](https://github.com/jmcsmith/MTGJsonClasses/actions/workflows/swift.yml)
[![Swift 6.1](https://img.shields.io/badge/Swift-6.1-orange?logo=swift)](https://swift.org) [![SwiftPM Compatible](https://img.shields.io/badge/SwiftPM-compatible-orange?logo=swift)](https://www.swift.org/package-manager/)
[![Xcode 26.2+](https://img.shields.io/badge/Xcode-26.2%2B-blue?logo=xcode)](https://developer.apple.com/xcode/) ![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20visionOS-blue) [![License](https://img.shields.io/github/license/jmcsmith/MTGJsonClasses)](https://github.com/jmcsmith/MTGJsonClasses/blob/main/LICENSE)

## Features

- Decodable Swift types for MTGJSON set files and related entities:
  - `MTGJsonSetFile`, `MTGJsonSetData`, `MTGJsonMeta`
  - `MTGJsonCard`, `MTGJsonToken`
  - `MTGJsonBooster`, `MTGJsonBoosterMode`
  - Supporting types like `MTGJsonCardIdentifiers`, `MTGJsonForeignData`, `MTGJsonLegalities`, `MTGJsonRuling`, `MTGJsonLeadershipSkills`, and utility `StringOrInt`.
- DTOs for TCGPlayer SKUs responses: `TCGPlayerSkusDTO`.
- Foundation-based JSON decoding using `JSONDecoder` (no external dependencies).
- Modern Swift code style; suitable for use with Swift Concurrency in your app code.

## Requirements

- Swift 6.1+
- Xcode 26.2+
- Platforms: iOS 15+, macOS 12+, watchOS 8+, tvOS 15+, visionOS 1.0+  
  (The package itself is platform-agnostic; these are typical deployment minimums.)

## Installation (Swift Package Manager)

Add the package to your `Package.swift` dependencies. You can either track a branch during development or pin to a version once tags are available.

```swift
// In your Package.swift
.dependencies = [
    // Option A: Track the main branch during development
    .package(url: "https://github.com/jmcsmith/MTGJsonClasses.git", branch: "main"),

    // Option B: Pin to a version once tags are available
    // .package(url: "https://github.com/jmcsmith/MTGJsonClasses.git", from: "0.1.0"),
]

.targets = [
    .target(
        name: "YourTarget",
        dependencies: [
            "MTGJsonClasses",
        ]
    ),
]


