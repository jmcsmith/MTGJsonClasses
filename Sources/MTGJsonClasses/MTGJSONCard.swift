import Foundation

public struct MTGJSONCard: Codable, Sendable {
    public var artist: String?
    public var artistIds: [String]?
    public var asciiName: String?
    public var attractionLights: [Int]?
    public var availability: [String] = []
    public var borderColor: String
    public var boosterTypes: [String]?
    public var cardParts: [String]?
    public var colorIdentity: [String] = []
    public var colorIndicator: [String]?
    public var colors: [String] = []
    public var convertedManaCost: Double
    public var defense: String?
    public var duelDeck: String?
    public var edhrecRank: Int?
    public var edhrecSaltiness: Double?
    public var faceConvertedManaCost: Double?
    public var faceFlavorName: String?
    public var faceManaValue: Double?
    public var faceName: String?
    public var finishes: [String] = []
    public var flavorName: String?
    public var flavorText: String?
    public var foreignData: [MTGJSONForeignData]?
    public var frameEffects: [String]?
    public var frameVersion: String
    public var hand: String?
    public var hasAlternativeDeckLimit: Bool?
    public var hasContentWarning: Bool?
    public var identifiers: MTGJSONIdentifiers
    public var isAlternative: Bool?
    public var isFullArt: Bool?
    public var isFunny: Bool?
    public var isGameChanger: Bool?
    public var isOnlineOnly: Bool?
    public var isOversized: Bool?
    public var isPromo: Bool?
    public var isRebalanced: Bool?
    public var isReprint: Bool?
    public var isReserved: Bool?
    public var isStorySpotlight: Bool?
    public var isTextless: Bool?
    public var isTimeshifted: Bool?
    public var keywords: [String]?
    public var language: String
    public var layout: String
    public var legalities: MTGJSONLegalities
    public var leadershipSkills: MTGJSONLeadershipSkills?
    public var life: String?
    public var loyalty: String?
    public var manaCost: String?
    public var manaValue: Double
    public var name: String
    public var number: String
    public var originalPrintings: [String]?
    public var originalReleaseDate: String?
    public var originalText: String?
    public var originalType: String?
    public var otherFaceIds: [String]?
    public var power: String?
    public var printedName: String?
    public var printedText: String?
    public var printedType: String?
    public var printings: [String]?
    public var producedMana: [String]?
    public var promoTypes: [String]?
    public var purchaseUrls: MTGJSONPurchaseUrls
    public var rarity: String
    public var rebalancedPrintings: [String]?
    public var relatedCards: MTGJSONRelatedCards?
    public var reverseRelated: [String]?
    public var rulings: [MTGJSONRuling]?
    public var securityStamp: String?
    public var setCode: String
    public var side: String?
    public var signature: String?
    public var sourceProducts: MTGJSONSourceProducts?
    public var subtypes: [String] = []
    public var supertypes: [String] = []
    public var text: String?
    public var toughness: String?
    public var type: String
    public var types: [String] = []
    public var uuid: String
    public var variations: [String]?
    public var watermark: String?

    public init(
        uuid: String,
        name: String,
        layout: String,
        number: String,
        rarity: String,
        setCode: String,
        language: String,
        manaValue: Double,
        convertedManaCost: Double,
        type: String,
        types: [String] = [],
        supertypes: [String] = [],
        subtypes: [String] = [],
        colors: [String] = [],
        colorIdentity: [String] = [],
        frameVersion: String,
        borderColor: String,
        finishes: [String] = [],
        availability: [String] = [],
        identifiers: MTGJSONIdentifiers,
        legalities: MTGJSONLegalities,
        purchaseUrls: MTGJSONPurchaseUrls
    ) {
        self.uuid = uuid
        self.name = name
        self.layout = layout
        self.number = number
        self.rarity = rarity
        self.setCode = setCode
        self.language = language
        self.manaValue = manaValue
        self.convertedManaCost = convertedManaCost
        self.type = type
        self.types = types
        self.supertypes = supertypes
        self.subtypes = subtypes
        self.colors = colors
        self.colorIdentity = colorIdentity
        self.frameVersion = frameVersion
        self.borderColor = borderColor
        self.finishes = finishes
        self.availability = availability
        self.identifiers = identifiers
        self.legalities = legalities
        self.purchaseUrls = purchaseUrls
    }
}

