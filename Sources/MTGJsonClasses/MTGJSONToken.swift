import Foundation

public struct MTGJSONToken: Codable, Sendable {
    // @unchecked because some nested optional types (e.g., MTGJSONRelatedCards, MTGJSONSourceProducts) don't conform to Sendable.
    // Required fields based on TypeScript definition
    public var availability: [String]
    public var borderColor: String
    public var colorIdentity: [String]
    public var colors: [String]
    public var finishes: [String]
    public var frameVersion: String
    public var identifiers: MTGJSONIdentifiers
    public var language: String
    public var layout: String
    public var name: String
    public var number: String
    public var setCode: String
    public var subtypes: [String]
    public var supertypes: [String]
    public var type: String
    public var types: [String]
    public var uuid: String

    // Optional fields
    public var artist: String?
    public var artistIds: [String]?
    public var asciiName: String?
    public var boosterTypes: [String]?
    public var cardParts: [String]?
    public var colorIndicator: [String]?
    public var edhrecSaltiness: Double?
    public var faceFlavorName: String?
    public var faceName: String?
    public var flavorName: String?
    public var flavorText: String?
    public var frameEffects: [String]?
    public var hasFoil: Bool?
    public var hasNonFoil: Bool?
    public var isFullArt: Bool?
    public var isFunny: Bool?
    public var isOnlineOnly: Bool?
    public var isOversized: Bool?
    public var isPromo: Bool?
    public var isReprint: Bool?
    public var isTextless: Bool?
    public var keywords: [String]?
    public var layoutSide: String? // not in TS; kept for backward compatibility if needed
    public var loyalty: String?
    public var manaCost: String?
    public var orientation: String?
    public var originalText: String?
    public var originalType: String?
    public var otherFaceIds: [String]?
    public var power: String?
    public var producedMana: [String]? // not in TS; preserved if present in JSON but optional
    public var promoTypes: [String]?
    public var relatedCards: MTGJSONRelatedCards?
    public var reverseRelated: [String]?
    public var securityStamp: String?
    public var signature: String?
    public var sourceProducts: MTGJSONSourceProducts?
    public var subsets: [String]?
    public var tokenProducts: [MTGJSONTokenProduct]? // project-specific
    public var toughness: String?
    public var watermark: String?

    // Backward-compatible fields retained from previous model
    public var asciiNameDeprecated: String? // alias if needed
    public var frameVersionDeprecated: String? // alias if needed

    public init(
        uuid: String,
        name: String,
        number: String,
        setCode: String,
        language: String,
        layout: String,
        borderColor: String,
        frameVersion: String,
        availability: [String],
        finishes: [String],
        colorIdentity: [String],
        colors: [String],
        types: [String],
        supertypes: [String],
        subtypes: [String],
        type: String,
        identifiers: MTGJSONIdentifiers
    ) {
        self.uuid = uuid
        self.name = name
        self.number = number
        self.setCode = setCode
        self.language = language
        self.layout = layout
        self.borderColor = borderColor
        self.frameVersion = frameVersion
        self.availability = availability
        self.finishes = finishes
        self.colorIdentity = colorIdentity
        self.colors = colors
        self.types = types
        self.supertypes = supertypes
        self.subtypes = subtypes
        self.type = type
        self.identifiers = identifiers
    }
}

