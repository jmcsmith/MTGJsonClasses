import Foundation

public struct MTGJSONTokenProduct: Codable, Sendable {
    public var identifiers: MTGJSONIdentifiers?
    public var purchaseUrls: MTGJSONPurchaseUrls?
    public var tokenParts: [MTGJSONTokenPart]?
}

