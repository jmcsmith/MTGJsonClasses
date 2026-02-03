import Foundation

public final class MTGJSONCard: Codable {
    public var uuid: String

    public var name: String
    public var asciiName: String?
    public var faceName: String?

    public var layout: String?
    public var side: String?

    public var number: String?
    public var rarity: String?
    public var setCode: String?
    public var language: String?

    public var manaCost: String?
    public var manaValue: Double?
    public var convertedManaCost: Double?
    public var faceManaValue: Double?
    public var faceConvertedManaCost: Double?

    public var type: String?
    public var types: [String]?
    public var supertypes: [String]?
    public var subtypes: [String]?

    public var text: String?
    public var originalText: String?
    public var printedText: String?

    public var printedName: String?
    public var printedType: String?

    public var power: String?
    public var toughness: String?
    public var loyalty: String?

    public var artist: String?
    public var artistIds: [String]?

    public var flavorText: String?
    public var flavorName: String?

    public var colors: [String]?
    public var colorIdentity: [String]?
    public var colorIndicator: [String]?
    public var producedMana: [String]?

    public var keywords: [String]?
    public var frameEffects: [String]?
    public var frameVersion: String?
    public var borderColor: String?
    public var watermark: String?
    public var securityStamp: String?

    public var finishes: [String]?
    public var availability: [String]?
    public var boosterTypes: [String]?

    public var hasFoil: Bool?
    public var hasNonFoil: Bool?
    public var hasContentWarning: Bool?

    public var isAlternative: Bool?
    public var isFullArt: Bool?
    public var isGameChanger: Bool?
    public var isOnlineOnly: Bool?
    public var isPromo: Bool?
    public var isRebalanced: Bool?
    public var isReprint: Bool?
    public var isReserved: Bool?
    public var isStorySpotlight: Bool?

    public var duelDeck: String?
    public var edhrecRank: Int?
    public var edhrecSaltiness: Double?

    public var identifiers: MTGJSONIdentifiers?
    public var legalities: MTGJSONLegalities?
    public var leadershipSkills: MTGJSONLeadershipSkills?

    public var foreignData: [MTGJSONForeignData]?
    public var rulings: [MTGJSONRuling]?

    public var otherFaceIds: [String]?
    public var variations: [String]?

    public var relatedCards: MTGJSONRelatedCards?
    public var reverseRelated: [String]?

    public var originalPrintings: [String]?
    public var originalReleaseDate: String?
    public var printings: [String]?
    public var rebalancedPrintings: [String]?

    public var promoTypes: [String]?
    public var purchaseUrls: MTGJSONPurchaseUrls?

    public var sourceProducts: MTGJSONSourceProducts?

    public init(
        uuid: String,
        name: String
    ) {
        self.uuid = uuid
        self.name = name
    }
}
