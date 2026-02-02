# MTGJsonClasses

This package provides Swift models/DTOs for decoding MTGJSON data and related TCGPlayer payloads, suitable for iOS, macOS, and other Swift platforms.

[![Tests](https://github.com/jmcsmith/MTGJsonClasses/actions/workflows/swift.yml/badge.svg)](https://github.com/jmcsmith/MTGJsonClasses/actions/workflows/swift.yml)

## Features

- Decodable Swift types for MTGJSON set files, cards, tokens, and related data (e.g. `MTGJsonSetFile`, `MTGJsonBooster`, `MTGJsonCardFace`, `MTGJsonToken`).
- DTOs for TCGPlayer SKUs responses (`TCGPlayerSkusDTO`).
- Swift 6.2 toolchain support and modern Swift Concurrency-friendly types.
- Foundation-based JSON decoding with `JSONDecoder`.

## Requirements

- Swift 6.2+
- Xcode 26.2+
- Platforms: iOS 15+, macOS 12+, watchOS 8+, tvOS 15+, visionOS 1.0+  
  (Package is platform-agnostic but these are typical minimums)

## Installation

Use Swift Package Manager to add this package as a dependency:
```swift
// In your Package.swift
dependencies: [
    .package(url: "https://github.com/your-org/your-repo.git", from: "1.0.0"),
],

targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            "MTGJsonClasses",
        ]),
]

