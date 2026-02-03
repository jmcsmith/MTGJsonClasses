import Foundation

public final class MTGJSONSetData: Codable {
    public var baseSetSize: Int
    public var totalSetSize: Int?
    public var block: String?

    public var code: String
    public var keyruneCode: String?
    public var mtgoCode: String?

    public var name: String?
    public var type: String?
    public var parentCode: String?
    public var releaseDate: String?

    public var languages: [String]

    public var isFoilOnly: Bool
    public var isNonFoilOnly: Bool?
    public var isOnlineOnly: Bool
    public var isPartialPreview: Bool?

    public var mcmId: Int?
    /// Some MTGJSON exports emit `mcmIdExtras` as either `[Int]` or a single `Int`.
    /// We store it as an array; if the JSON is a single number we coerce to `[number]`.
    public var mcmIdExtras: [Int]?
    public var mcmName: String?

    public var tcgplayerGroupId: Int?
    public var tokenSetCode: String?

    public var translations: MTGJSONTranslations?

    public var booster: MTGJSONBooster?
    public var sealedProduct: [MTGJSONSealedProduct]?
    public var decks: [MTGJSONDeck]?

    public var cards: [MTGJSONCard]
    public var tokens: [MTGJSONToken]?

    private enum CodingKeys: String, CodingKey {
        case baseSetSize, totalSetSize, block
        case code, keyruneCode, mtgoCode
        case name, type, parentCode, releaseDate
        case languages
        case isFoilOnly, isNonFoilOnly, isOnlineOnly, isPartialPreview
        case mcmId, mcmIdExtras, mcmName
        case tcgplayerGroupId, tokenSetCode
        case translations
        case booster, sealedProduct, decks
        case cards, tokens
    }

    public init(
        baseSetSize: Int,
        totalSetSize: Int? = nil,
        block: String? = nil,
        code: String,
        keyruneCode: String? = nil,
        mtgoCode: String? = nil,
        name: String? = nil,
        type: String? = nil,
        parentCode: String? = nil,
        releaseDate: String? = nil,
        languages: [String],
        isFoilOnly: Bool,
        isNonFoilOnly: Bool? = nil,
        isOnlineOnly: Bool,
        mcmId: Int? = nil,
        mcmIdExtras: [Int]? = nil,
        mcmName: String? = nil,
        tcgplayerGroupId: Int? = nil,
        tokenSetCode: String? = nil,
        translations: MTGJSONTranslations? = nil,
        booster: MTGJSONBooster? = nil,
        sealedProduct: [MTGJSONSealedProduct]? = nil,
        decks: [MTGJSONDeck]? = nil,
        cards: [MTGJSONCard],
        tokens: [MTGJSONToken]? = nil
    ) {
        self.baseSetSize = baseSetSize
        self.totalSetSize = totalSetSize
        self.block = block
        self.code = code
        self.keyruneCode = keyruneCode
        self.mtgoCode = mtgoCode
        self.name = name
        self.type = type
        self.parentCode = parentCode
        self.releaseDate = releaseDate
        self.languages = languages
        self.isFoilOnly = isFoilOnly
        self.isNonFoilOnly = isNonFoilOnly
        self.isOnlineOnly = isOnlineOnly
        self.mcmId = mcmId
        self.mcmIdExtras = mcmIdExtras
        self.mcmName = mcmName
        self.tcgplayerGroupId = tcgplayerGroupId
        self.tokenSetCode = tokenSetCode
        self.translations = translations
        self.booster = booster
        self.sealedProduct = sealedProduct
        self.decks = decks
        self.cards = cards
        self.tokens = tokens
    }

    public required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        self.baseSetSize = try c.decode(Int.self, forKey: .baseSetSize)
        self.totalSetSize = try c.decodeIfPresent(Int.self, forKey: .totalSetSize)
        self.block = try c.decodeIfPresent(String.self, forKey: .block)

        self.code = try c.decode(String.self, forKey: .code)
        self.keyruneCode = try c.decodeIfPresent(String.self, forKey: .keyruneCode)
        self.mtgoCode = try c.decodeIfPresent(String.self, forKey: .mtgoCode)

        self.name = try c.decodeIfPresent(String.self, forKey: .name)
        self.type = try c.decodeIfPresent(String.self, forKey: .type)
        self.parentCode = try c.decodeIfPresent(String.self, forKey: .parentCode)
        self.releaseDate = try c.decodeIfPresent(String.self, forKey: .releaseDate)

        self.languages = try c.decode([String].self, forKey: .languages)

        self.isFoilOnly = try c.decode(Bool.self, forKey: .isFoilOnly)
        self.isNonFoilOnly = try c.decodeIfPresent(Bool.self, forKey: .isNonFoilOnly)
        self.isOnlineOnly = try c.decode(Bool.self, forKey: .isOnlineOnly)
        self.isPartialPreview = try c.decodeIfPresent(Bool.self, forKey: .isPartialPreview)

        self.mcmId = try c.decodeIfPresent(Int.self, forKey: .mcmId)

        // FIX: accept either [Int] or Int for mcmIdExtras
        if c.contains(.mcmIdExtras) {
            if let arr = try? c.decode([Int].self, forKey: .mcmIdExtras) {
                self.mcmIdExtras = arr
            } else if let single = try? c.decode(Int.self, forKey: .mcmIdExtras) {
                self.mcmIdExtras = [single]
            } else {
                self.mcmIdExtras = nil
            }
        } else {
            self.mcmIdExtras = nil
        }

        self.mcmName = try c.decodeIfPresent(String.self, forKey: .mcmName)

        self.tcgplayerGroupId = try c.decodeIfPresent(Int.self, forKey: .tcgplayerGroupId)
        self.tokenSetCode = try c.decodeIfPresent(String.self, forKey: .tokenSetCode)

        self.translations = try c.decodeIfPresent(MTGJSONTranslations.self, forKey: .translations)

        self.booster = try c.decodeIfPresent(MTGJSONBooster.self, forKey: .booster)
        self.sealedProduct = try c.decodeIfPresent([MTGJSONSealedProduct].self, forKey: .sealedProduct)
        self.decks = try c.decodeIfPresent([MTGJSONDeck].self, forKey: .decks)

        self.cards = try c.decode([MTGJSONCard].self, forKey: .cards)
        self.tokens = try c.decodeIfPresent([MTGJSONToken].self, forKey: .tokens)
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)

        try c.encode(baseSetSize, forKey: .baseSetSize)
        try c.encodeIfPresent(totalSetSize, forKey: .totalSetSize)
        try c.encodeIfPresent(block, forKey: .block)

        try c.encode(code, forKey: .code)
        try c.encodeIfPresent(keyruneCode, forKey: .keyruneCode)
        try c.encodeIfPresent(mtgoCode, forKey: .mtgoCode)

        try c.encodeIfPresent(name, forKey: .name)
        try c.encodeIfPresent(type, forKey: .type)
        try c.encodeIfPresent(parentCode, forKey: .parentCode)
        try c.encodeIfPresent(releaseDate, forKey: .releaseDate)

        try c.encode(languages, forKey: .languages)

        try c.encode(isFoilOnly, forKey: .isFoilOnly)
        try c.encodeIfPresent(isNonFoilOnly, forKey: .isNonFoilOnly)
        try c.encode(isOnlineOnly, forKey: .isOnlineOnly)
        try c.encodeIfPresent(isPartialPreview, forKey: .isPartialPreview)

        try c.encodeIfPresent(mcmId, forKey: .mcmId)
        // Encode as array form (most common / most useful)
        try c.encodeIfPresent(mcmIdExtras, forKey: .mcmIdExtras)
        try c.encodeIfPresent(mcmName, forKey: .mcmName)

        try c.encodeIfPresent(tcgplayerGroupId, forKey: .tcgplayerGroupId)
        try c.encodeIfPresent(tokenSetCode, forKey: .tokenSetCode)

        try c.encodeIfPresent(translations, forKey: .translations)

        try c.encodeIfPresent(booster, forKey: .booster)
        try c.encodeIfPresent(sealedProduct, forKey: .sealedProduct)
        try c.encodeIfPresent(decks, forKey: .decks)

        try c.encode(cards, forKey: .cards)
        try c.encodeIfPresent(tokens, forKey: .tokens)
    }
}
