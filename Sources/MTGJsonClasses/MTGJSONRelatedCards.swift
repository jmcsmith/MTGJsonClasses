import Foundation

/// Tokens (and occasionally cards) may include a `relatedCards` object.
/// Example in EOE: { "reverseRelated": [ ... ] }
public struct MTGJSONRelatedCards: Codable, Sendable {
    public var related: [String]?
    public var reverseRelated: [String]?
    public var tokens: [String]?

    private enum CodingKeys: String, CodingKey {
        case reverseRelated
        case related
        case tokens
    }

    public init(reverseRelated: [String]? = nil, related: [String]? = nil, tokens: [String]? = nil) {
        self.reverseRelated = reverseRelated
        self.related = related
        self.tokens = tokens
    }
}
