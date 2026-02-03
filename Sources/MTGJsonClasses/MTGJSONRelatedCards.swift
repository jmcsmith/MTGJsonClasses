import Foundation

/// Tokens (and occasionally cards) may include a `relatedCards` object.
/// Example in EOE: { "reverseRelated": [ ... ] }
public final class MTGJSONRelatedCards: Codable {
    public var reverseRelated: [String]?
    public var related: [String]?

    private enum CodingKeys: String, CodingKey {
        case reverseRelated
        case related
    }

    public init(reverseRelated: [String]? = nil, related: [String]? = nil) {
        self.reverseRelated = reverseRelated
        self.related = related
    }
}
