# MTGJsonClasses

Swift models/DTOs for decoding MTGJSON data and related TCGPlayer payloads. Works across Apple platforms via Swift Package Manager.

[![Tests](https://github.com/jmcsmith/MTGJsonClasses/actions/workflows/swift.yml/badge.svg)](https://github.com/jmcsmith/MTGJsonClasses/actions/workflows/swift.yml)
[![Swift 6.1](https://img.shields.io/badge/Swift-6.1-orange?logo=swift)](https://swift.org) [![SwiftPM Compatible](https://img.shields.io/badge/SwiftPM-compatible-orange?logo=swift)](https://www.swift.org/package-manager/)
[![Xcode 26.2+](https://img.shields.io/badge/Xcode-26.2%2B-blue?logo=xcode)](https://developer.apple.com/xcode/) ![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20visionOS-blue) 

## Features

- Decodable Swift types for MTGJSON set files and related entities:
  - `MTGJSONSetFile`, `MTGJSONSetData`, `MTGJSONMeta`
  - `MTGJsonCard`, `MTGJsonToken`
  - `MTGJsonBooster`, `MTGJsonBoosterMode`
  - Supporting types like `MTGJSONIdentifiers`, `MTGJsonForeignData`, `MTGJsonLegalities`, `MTGJsonRuling`, `MTGJsonLeadershipSkills`, and utility `StringOrInt`.
- DTOs for TCGplayer SKUs responses: `TCGPlayerSkusDTO` with nested `Meta` and `SKU` (including `Condition`, `Finish`, `Language`, `Printing`).
- Foundation-based JSON decoding using `JSONDecoder` (no external dependencies).
- Modern Swift code style; suitable for use with Swift Concurrency in your app code.
- Swift Testing-based test suites covering decoding, including live MTGJSON fetch tests and `TCGPlayerSkusDTOTests`.

## Usage

```swift
import MTGJsonClasses
import Foundation

let json = """
{ "meta": { "date": "2025-09-20", "version": "5.2.2+20250920" },
  "data": { "some-card-uuid": [
    { "condition": "NEAR MINT", "language": "ENGLISH", "printing": "FOIL", "productId": 111268, "skuId": 3045711 }
  ]}
}
""".data(using: .utf8)!

let dto = try JSONDecoder().decode(TCGPlayerSkusDTO.self, from: json)
print(dto.meta.version) // 5.2.2+20250920

