import Foundation

public struct MTGJSONSealedProduct: Codable, Sendable {
    public var cardCount: Int?
    public var category: String?
    public var contents: MTGJSONSealedProductContents?
    public var identifiers: MTGJSONIdentifiers?
    public var language: String?
    public var name: String
    public var purchaseUrls: MTGJSONPurchaseUrls?
    public var releaseDate: String?
    public var subtype: String?
    public var uuid: String

    public init(
        uuid: String,
        name: String,
        category: String? = nil,
        subtype: String? = nil,
        releaseDate: String? = nil,
        language: String? = nil,
        cardCount: Int? = nil,
        contents: MTGJSONSealedProductContents? = nil,
        identifiers: MTGJSONIdentifiers? = nil,
        purchaseUrls: MTGJSONPurchaseUrls? = nil
    ) {
        self.uuid = uuid
        self.name = name
        self.category = category
        self.subtype = subtype
        self.releaseDate = releaseDate
        self.language = language
        self.cardCount = cardCount
        self.contents = contents
        self.identifiers = identifiers
        self.purchaseUrls = purchaseUrls
    }
}
