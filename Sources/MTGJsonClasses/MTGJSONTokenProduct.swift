import Foundation

public final class MTGJSONTokenProduct: Codable {
    public var identifiers: MTGJSONIdentifiers?
    public var purchaseUrls: MTGJSONPurchaseUrls?
    public var tokenParts: [MTGJSONTokenPart]?
}
