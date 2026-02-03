import Foundation

public final class MTGJSONToken: Codable {
    public var uuid: String

    public var name: String
    public var asciiName: String?
    public var faceName: String?
    public var layout: String?
    public var side: String?

    public var number: String?
    public var setCode: String?
    public var language: String?

    public var type: String?
    public var types: [String]?
    public var supertypes: [String]?
    public var subtypes: [String]?

    public var manaCost: String?
    public var text: String?

    public var power: String?
    public var toughness: String?

    public var artist: String?
    public var artistIds: [String]?

    public var borderColor: String?
    public var frameEffects: [String]?
    public var frameVersion: String?

    public var finishes: [String]?
    public var availability: [String]?

    public var colors: [String]?
    public var colorIdentity: [String]?
    public var producedMana: [String]?

    public var hasFoil: Bool?
    public var hasNonFoil: Bool?
    public var isFullArt: Bool?
    public var isReprint: Bool?

    public var keywords: [String]?
    public var promoTypes: [String]?

    public var identifiers: MTGJSONIdentifiers?

    public var signature: String?
    public var relatedCards: MTGJSONRelatedCards?
    public var reverseRelated: [String]?
    public var otherFaceIds: [String]?

    public var edhrecSaltiness: Double?

    public var tokenProducts: [MTGJSONTokenProduct]?

    public init(uuid: String, name: String) {
        self.uuid = uuid
        self.name = name
    }
}
