import Foundation

public struct MTGJSONSetData: Codable, Sendable {
    public let baseSetSize: Int
    public let block: String?
    public let booster: MTGJSONBooster?
    public let cards: [MTGJSONCard]
    public let cardsphereSetId: Int?
    public let code: String
    public let codeV3: String?
    public let decks: [MTGJSONDeck]?
    public let isFoilOnly: Bool
    public let isForeignOnly: Bool?
    public let isNonFoilOnly: Bool?
    public let isOnlineOnly: Bool
    public let isPaperOnly: Bool?
    public let isPartialPreview: Bool?
    public let keyruneCode: String
    public let languages: [String]?
    public let mcmId: Int?
    /// Some MTGJSON exports emit `mcmIdExtras` as either `[Int]` or a single `Int`.
    /// We store it as an array; if the JSON is a single number we coerce to `[number]`.
    public let mcmIdExtras: [Int]?
    public let mcmName: String?
    public let mtgoCode: String?
    public let name: String
    public let parentCode: String?
    public let releaseDate: String
    public let sealedProduct: [MTGJSONSealedProduct]?
    public let tcgplayerGroupId: Int?
    public let tokenSetCode: String?
    public let tokens: [MTGJSONToken]
    public let totalSetSize: Int
    public let translations: MTGJSONTranslations
    public let type: String

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

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        let baseSetSize = try c.decode(Int.self, forKey: .baseSetSize)
        let totalSetSize = try c.decode(Int.self, forKey: .totalSetSize)
        let block = try c.decodeIfPresent(String.self, forKey: .block)

        let code = try c.decode(String.self, forKey: .code)
        let codeV3 = try c.decodeIfPresent(String.self, forKey: .codeV3)
        let keyruneCode = try c.decode(String.self, forKey: .keyruneCode)
        let mtgoCode = try c.decodeIfPresent(String.self, forKey: .mtgoCode)

        let name = try c.decode(String.self, forKey: .name)
        let type = try c.decode(String.self, forKey: .type)
        let parentCode = try c.decodeIfPresent(String.self, forKey: .parentCode)
        let releaseDate = try c.decode(String.self, forKey: .releaseDate)

        let languages = try c.decodeIfPresent([String].self, forKey: .languages)

        let isFoilOnly = try c.decode(Bool.self, forKey: .isFoilOnly)
        let isForeignOnly = try c.decodeIfPresent(Bool.self, forKey: .isForeignOnly)
        let isPaperOnly = try c.decodeIfPresent(Bool.self, forKey: .isPaperOnly)
        let isNonFoilOnly = try c.decodeIfPresent(Bool.self, forKey: .isNonFoilOnly)
        let isOnlineOnly = try c.decode(Bool.self, forKey: .isOnlineOnly)
        let isPartialPreview = try c.decodeIfPresent(Bool.self, forKey: .isPartialPreview)

        let cardsphereSetId = try c.decodeIfPresent(Int.self, forKey: .cardsphereSetId)
        let mcmId = try c.decodeIfPresent(Int.self, forKey: .mcmId)

        // FIX: accept either [Int] or Int for mcmIdExtras
        let mcmIdExtras: [Int]?
        if c.contains(.mcmIdExtras) {
            if let arr = try? c.decode([Int].self, forKey: .mcmIdExtras) {
                mcmIdExtras = arr
            } else if let single = try? c.decode(Int.self, forKey: .mcmIdExtras) {
                mcmIdExtras = [single]
            } else {
                mcmIdExtras = nil
            }
        } else {
            mcmIdExtras = nil
        }

        let mcmName = try c.decodeIfPresent(String.self, forKey: .mcmName)

        let tcgplayerGroupId = try c.decodeIfPresent(Int.self, forKey: .tcgplayerGroupId)
        let tokenSetCode = try c.decodeIfPresent(String.self, forKey: .tokenSetCode)

        let translations = try c.decode(MTGJSONTranslations.self, forKey: .translations)

        let booster = try c.decodeIfPresent(MTGJSONBooster.self, forKey: .booster)
        let sealedProduct = try c.decodeIfPresent([MTGJSONSealedProduct].self, forKey: .sealedProduct)
        let decks = try c.decodeIfPresent([MTGJSONDeck].self, forKey: .decks)

        let cards = try c.decode([MTGJSONCard].self, forKey: .cards)
        let tokens = try c.decode([MTGJSONToken].self, forKey: .tokens)

        self = MTGJSONSetData(
            baseSetSize: baseSetSize,
            totalSetSize: totalSetSize,
            block: block,
            code: code,
            codeV3: codeV3,
            keyruneCode: keyruneCode,
            mtgoCode: mtgoCode,
            name: name,
            type: type,
            parentCode: parentCode,
            releaseDate: releaseDate,
            languages: languages,
            isFoilOnly: isFoilOnly,
            isForeignOnly: isForeignOnly,
            isPaperOnly: isPaperOnly,
            isNonFoilOnly: isNonFoilOnly,
            isOnlineOnly: isOnlineOnly,
            isPartialPreview: isPartialPreview,
            cardsphereSetId: cardsphereSetId,
            mcmId: mcmId,
            mcmIdExtras: mcmIdExtras,
            mcmName: mcmName,
            tcgplayerGroupId: tcgplayerGroupId,
            tokenSetCode: tokenSetCode,
            translations: translations,
            booster: booster,
            sealedProduct: sealedProduct,
            decks: decks,
            cards: cards,
            tokens: tokens
        )
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
