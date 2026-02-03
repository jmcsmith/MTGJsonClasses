import Foundation

public final class MTGJSONSealedProductContents: Codable {
    public var card: [MTGJSONSealedProductContentItem]?
    public var deck: [MTGJSONSealedProductContentItem]?
    public var other: [MTGJSONSealedProductContentItem]?
    public var pack: [MTGJSONSealedProductContentItem]?
    public var sealed: [MTGJSONSealedProductContentItem]?
}
