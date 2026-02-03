import Foundation

public final class MTGJSONSetData: Codable {
    public var baseSetSize: Int
    public var totalSetSize: Int
    public var block: String?

    public var code: String
    public var codeV3: String?
    public var keyruneCode: String
    public var mtgoCode: String?

    public var name: String
    public var type: String
    public var parentCode: String?
    public var releaseDate: String

    public var languages: [String]?

    public var isFoilOnly: Bool
    public var isForeignOnly: Bool?
    public var isPaperOnly: Bool?
    public var isNonFoilOnly: Bool?
    public var isOnlineOnly: Bool
    public var isPartialPreview: Bool?

    public var cardsphereSetId: Int?
    public var mcmId: Int?
    /// Some MTGJSON exports emit `mcmIdExtras` as either `[Int]` or a single `Int`.
    /// We store it as an array; if the JSON is a single number we coerce to `[number]`.
    public var mcmIdExtras: [Int]?
    public var mcmName: String?

    public var tcgplayerGroupId: Int?
    public var tokenSetCode: String?

    public var translations: MTGJSONTranslations

    public var booster: MTGJSONBooster?
    public var sealedProduct: [MTGJSONSealedProduct]?
    public var decks: [MTGJSONDeck]?

    public var cards: [MTGJSONCard]
    public var tokens: [MTGJSONToken]

    private enum CodingKeys: String, CodingKey {
        case baseSetSize, totalSetSize, block
        case code, codeV3, keyruneCode, mtgoCode
        case name, type, parentCode, releaseDate
        case languages
        case isFoilOnly, isForeignOnly, isPaperOnly, isNonFoilOnly, isOnlineOnly, isPartialPreview
        case cardsphereSetId, mcmId, mcmIdExtras, mcmName
        case tcgplayerGroupId, tokenSetCode
        case translations
        case booster, sealedProduct, decks
        case cards, tokens
    }

    public init(
        baseSetSize: Int,
        totalSetSize: Int,
        block: String? = nil,
        code: String,
        codeV3: String? = nil,
        keyruneCode: String,
        mtgoCode: String? = nil,
        name: String,
        type: String,
        parentCode: String? = nil,
        releaseDate: String,
        languages: [String]? = nil,
        isFoilOnly: Bool,
        isForeignOnly: Bool? = nil,
        isPaperOnly: Bool? = nil,
        isNonFoilOnly: Bool? = nil,
        isOnlineOnly: Bool,
        isPartialPreview: Bool? = nil,
        cardsphereSetId: Int? = nil,
        mcmId: Int? = nil,
        mcmIdExtras: [Int]? = nil,
        mcmName: String? = nil,
        tcgplayerGroupId: Int? = nil,
        tokenSetCode: String? = nil,
        translations: MTGJSONTranslations,
        booster: MTGJSONBooster? = nil,
        sealedProduct: [MTGJSONSealedProduct]? = nil,
        decks: [MTGJSONDeck]? = nil,
        cards: [MTGJSONCard],
        tokens: [MTGJSONToken]
    ) {
        self.baseSetSize = baseSetSize
        self.totalSetSize = totalSetSize
        self.block = block
        self.code = code
        self.codeV3 = codeV3
        self.keyruneCode = keyruneCode
        self.mtgoCode = mtgoCode
        self.name = name
        self.type = type
        self.parentCode = parentCode
        self.releaseDate = releaseDate
        self.languages = languages
        self.isFoilOnly = isFoilOnly
        self.isForeignOnly = isForeignOnly
        self.isPaperOnly = isPaperOnly
        self.isNonFoilOnly = isNonFoilOnly
        self.isOnlineOnly = isOnlineOnly
        self.isPartialPreview = isPartialPreview
        self.cardsphereSetId = cardsphereSetId
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
        self.totalSetSize = try c.decode(Int.self, forKey: .totalSetSize)
        self.block = try c.decodeIfPresent(String.self, forKey: .block)

        self.code = try c.decode(String.self, forKey: .code)
        self.codeV3 = try c.decodeIfPresent(String.self, forKey: .codeV3)
        self.keyruneCode = try c.decode(String.self, forKey: .keyruneCode)
        self.mtgoCode = try c.decodeIfPresent(String.self, forKey: .mtgoCode)

        self.name = try c.decode(String.self, forKey: .name)
        self.type = try c.decode(String.self, forKey: .type)
        self.parentCode = try c.decodeIfPresent(String.self, forKey: .parentCode)
        self.releaseDate = try c.decode(String.self, forKey: .releaseDate)

        self.languages = try c.decodeIfPresent([String].self, forKey: .languages)

        self.isFoilOnly = try c.decode(Bool.self, forKey: .isFoilOnly)
        self.isForeignOnly = try c.decodeIfPresent(Bool.self, forKey: .isForeignOnly)
        self.isPaperOnly = try c.decodeIfPresent(Bool.self, forKey: .isPaperOnly)
        self.isNonFoilOnly = try c.decodeIfPresent(Bool.self, forKey: .isNonFoilOnly)
        self.isOnlineOnly = try c.decode(Bool.self, forKey: .isOnlineOnly)
        self.isPartialPreview = try c.decodeIfPresent(Bool.self, forKey: .isPartialPreview)

        self.cardsphereSetId = try c.decodeIfPresent(Int.self, forKey: .cardsphereSetId)
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

        self.translations = try c.decode(MTGJSONTranslations.self, forKey: .translations)

        self.booster = try c.decodeIfPresent(MTGJSONBooster.self, forKey: .booster)
        self.sealedProduct = try c.decodeIfPresent([MTGJSONSealedProduct].self, forKey: .sealedProduct)
        self.decks = try c.decodeIfPresent([MTGJSONDeck].self, forKey: .decks)

        self.cards = try c.decode([MTGJSONCard].self, forKey: .cards)
        self.tokens = try c.decode([MTGJSONToken].self, forKey: .tokens)
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)

        try c.encode(baseSetSize, forKey: .baseSetSize)
        try c.encode(totalSetSize, forKey: .totalSetSize)
        try c.encodeIfPresent(block, forKey: .block)

        try c.encode(code, forKey: .code)
        try c.encodeIfPresent(codeV3, forKey: .codeV3)
        try c.encode(keyruneCode, forKey: .keyruneCode)
        try c.encodeIfPresent(mtgoCode, forKey: .mtgoCode)

        try c.encode(name, forKey: .name)
        try c.encode(type, forKey: .type)
        try c.encodeIfPresent(parentCode, forKey: .parentCode)
        try c.encode(releaseDate, forKey: .releaseDate)

        try c.encodeIfPresent(languages, forKey: .languages)

        try c.encode(isFoilOnly, forKey: .isFoilOnly)
        try c.encodeIfPresent(isForeignOnly, forKey: .isForeignOnly)
        try c.encodeIfPresent(isPaperOnly, forKey: .isPaperOnly)
        try c.encodeIfPresent(isNonFoilOnly, forKey: .isNonFoilOnly)
        try c.encode(isOnlineOnly, forKey: .isOnlineOnly)
        try c.encodeIfPresent(isPartialPreview, forKey: .isPartialPreview)

        try c.encodeIfPresent(cardsphereSetId, forKey: .cardsphereSetId)
        try c.encodeIfPresent(mcmId, forKey: .mcmId)
        // Encode as array form (most common / most useful)
        try c.encodeIfPresent(mcmIdExtras, forKey: .mcmIdExtras)
        try c.encodeIfPresent(mcmName, forKey: .mcmName)

        try c.encodeIfPresent(tcgplayerGroupId, forKey: .tcgplayerGroupId)
        try c.encodeIfPresent(tokenSetCode, forKey: .tokenSetCode)

        try c.encode(translations, forKey: .translations)

        try c.encodeIfPresent(booster, forKey: .booster)
        try c.encodeIfPresent(sealedProduct, forKey: .sealedProduct)
        try c.encodeIfPresent(decks, forKey: .decks)

        try c.encode(cards, forKey: .cards)
        try c.encode(tokens, forKey: .tokens)
    }
}
