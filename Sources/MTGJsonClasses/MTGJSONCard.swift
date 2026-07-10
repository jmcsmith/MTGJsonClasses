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

    /// Mirrors the compiler-synthesized decoder exactly (required fields use
    /// `decode`, optionals use `decodeIfPresent`), except that `foreignData`
    /// and `purchaseUrls` are skipped when the decoder is configured with
    /// `.mtgjsonLeanImport` — bulk importers never read them, and skipping
    /// avoids materializing per-language translation payloads for every card.
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        let lean = decoder.isLeanImport

        artist = try c.decodeIfPresent(String.self, forKey: .artist)
        artistIds = try c.decodeIfPresent([String].self, forKey: .artistIds)
        asciiName = try c.decodeIfPresent(String.self, forKey: .asciiName)
        attractionLights = try c.decodeIfPresent([Int].self, forKey: .attractionLights)
        availability = try c.decode([String].self, forKey: .availability)
        borderColor = try c.decode(String.self, forKey: .borderColor)
        boosterTypes = try c.decodeIfPresent([String].self, forKey: .boosterTypes)
        cardParts = try c.decodeIfPresent([String].self, forKey: .cardParts)
        colorIdentity = try c.decode([String].self, forKey: .colorIdentity)
        colorIndicator = try c.decodeIfPresent([String].self, forKey: .colorIndicator)
        colors = try c.decode([String].self, forKey: .colors)
        convertedManaCost = try c.decode(Double.self, forKey: .convertedManaCost)
        defense = try c.decodeIfPresent(String.self, forKey: .defense)
        duelDeck = try c.decodeIfPresent(String.self, forKey: .duelDeck)
        edhrecRank = try c.decodeIfPresent(Int.self, forKey: .edhrecRank)
        edhrecSaltiness = try c.decodeIfPresent(Double.self, forKey: .edhrecSaltiness)
        faceConvertedManaCost = try c.decodeIfPresent(Double.self, forKey: .faceConvertedManaCost)
        faceFlavorName = try c.decodeIfPresent(String.self, forKey: .faceFlavorName)
        faceManaValue = try c.decodeIfPresent(Double.self, forKey: .faceManaValue)
        faceName = try c.decodeIfPresent(String.self, forKey: .faceName)
        finishes = try c.decode([String].self, forKey: .finishes)
        flavorName = try c.decodeIfPresent(String.self, forKey: .flavorName)
        flavorText = try c.decodeIfPresent(String.self, forKey: .flavorText)
        foreignData = lean ? nil : try c.decodeIfPresent([MTGJSONForeignData].self, forKey: .foreignData)
        frameEffects = try c.decodeIfPresent([String].self, forKey: .frameEffects)
        frameVersion = try c.decode(String.self, forKey: .frameVersion)
        hand = try c.decodeIfPresent(String.self, forKey: .hand)
        hasAlternativeDeckLimit = try c.decodeIfPresent(Bool.self, forKey: .hasAlternativeDeckLimit)
        hasContentWarning = try c.decodeIfPresent(Bool.self, forKey: .hasContentWarning)
        identifiers = try c.decode(MTGJSONIdentifiers.self, forKey: .identifiers)
        isAlternative = try c.decodeIfPresent(Bool.self, forKey: .isAlternative)
        isFullArt = try c.decodeIfPresent(Bool.self, forKey: .isFullArt)
        isFunny = try c.decodeIfPresent(Bool.self, forKey: .isFunny)
        isGameChanger = try c.decodeIfPresent(Bool.self, forKey: .isGameChanger)
        isOnlineOnly = try c.decodeIfPresent(Bool.self, forKey: .isOnlineOnly)
        isOversized = try c.decodeIfPresent(Bool.self, forKey: .isOversized)
        isPromo = try c.decodeIfPresent(Bool.self, forKey: .isPromo)
        isRebalanced = try c.decodeIfPresent(Bool.self, forKey: .isRebalanced)
        isReprint = try c.decodeIfPresent(Bool.self, forKey: .isReprint)
        isReserved = try c.decodeIfPresent(Bool.self, forKey: .isReserved)
        isStorySpotlight = try c.decodeIfPresent(Bool.self, forKey: .isStorySpotlight)
        isTextless = try c.decodeIfPresent(Bool.self, forKey: .isTextless)
        isTimeshifted = try c.decodeIfPresent(Bool.self, forKey: .isTimeshifted)
        keywords = try c.decodeIfPresent([String].self, forKey: .keywords)
        language = try c.decode(String.self, forKey: .language)
        layout = try c.decode(String.self, forKey: .layout)
        legalities = try c.decode(MTGJSONLegalities.self, forKey: .legalities)
        leadershipSkills = try c.decodeIfPresent(MTGJSONLeadershipSkills.self, forKey: .leadershipSkills)
        life = try c.decodeIfPresent(String.self, forKey: .life)
        loyalty = try c.decodeIfPresent(String.self, forKey: .loyalty)
        manaCost = try c.decodeIfPresent(String.self, forKey: .manaCost)
        manaValue = try c.decode(Double.self, forKey: .manaValue)
        name = try c.decode(String.self, forKey: .name)
        number = try c.decode(String.self, forKey: .number)
        originalPrintings = try c.decodeIfPresent([String].self, forKey: .originalPrintings)
        originalReleaseDate = try c.decodeIfPresent(String.self, forKey: .originalReleaseDate)
        originalText = try c.decodeIfPresent(String.self, forKey: .originalText)
        originalType = try c.decodeIfPresent(String.self, forKey: .originalType)
        otherFaceIds = try c.decodeIfPresent([String].self, forKey: .otherFaceIds)
        power = try c.decodeIfPresent(String.self, forKey: .power)
        printedName = try c.decodeIfPresent(String.self, forKey: .printedName)
        printedText = try c.decodeIfPresent(String.self, forKey: .printedText)
        printedType = try c.decodeIfPresent(String.self, forKey: .printedType)
        printings = try c.decodeIfPresent([String].self, forKey: .printings)
        producedMana = try c.decodeIfPresent([String].self, forKey: .producedMana)
        promoTypes = try c.decodeIfPresent([String].self, forKey: .promoTypes)
        purchaseUrls = lean ? MTGJSONPurchaseUrls() : try c.decode(MTGJSONPurchaseUrls.self, forKey: .purchaseUrls)
        rarity = try c.decode(String.self, forKey: .rarity)
        rebalancedPrintings = try c.decodeIfPresent([String].self, forKey: .rebalancedPrintings)
        relatedCards = try c.decodeIfPresent(MTGJSONRelatedCards.self, forKey: .relatedCards)
        reverseRelated = try c.decodeIfPresent([String].self, forKey: .reverseRelated)
        rulings = try c.decodeIfPresent([MTGJSONRuling].self, forKey: .rulings)
        securityStamp = try c.decodeIfPresent(String.self, forKey: .securityStamp)
        setCode = try c.decode(String.self, forKey: .setCode)
        side = try c.decodeIfPresent(String.self, forKey: .side)
        signature = try c.decodeIfPresent(String.self, forKey: .signature)
        sourceProducts = try c.decodeIfPresent(MTGJSONSourceProducts.self, forKey: .sourceProducts)
        subtypes = try c.decode([String].self, forKey: .subtypes)
        supertypes = try c.decode([String].self, forKey: .supertypes)
        text = try c.decodeIfPresent(String.self, forKey: .text)
        toughness = try c.decodeIfPresent(String.self, forKey: .toughness)
        type = try c.decode(String.self, forKey: .type)
        types = try c.decode([String].self, forKey: .types)
        uuid = try c.decode(String.self, forKey: .uuid)
        variations = try c.decodeIfPresent([String].self, forKey: .variations)
        watermark = try c.decodeIfPresent(String.self, forKey: .watermark)
    }
}

