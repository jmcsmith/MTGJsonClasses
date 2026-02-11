import Foundation

public struct MTGJSONBoosterSheet: Codable, Sendable {
    public let allowDuplicates: Bool?
    public let balanceColors: Bool?
    public let cards: [MTGJSONBoosterSheetCard]?
    public let fixed: Bool?
    public let foil: Bool?
    /// Not in JSON — it's the object key from the parent `sheets` map.
    public var name: String = ""
    public let totalWeight: Int?

    private enum CodingKeys: String, CodingKey {
        case allowDuplicates, balanceColors, fixed, foil, totalWeight, cards
    }

    public init(name: String,
                allowDuplicates: Bool?,
                balanceColors: Bool?,
                fixed: Bool?,
                foil: Bool?,
                totalWeight: Int?,
                cards: [MTGJSONBoosterSheetCard]?) {
        self.name = name
        self.allowDuplicates = allowDuplicates
        self.balanceColors = balanceColors
        self.fixed = fixed
        self.foil = foil
        self.totalWeight = totalWeight
        self.cards = cards
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        let allowDuplicates = try c.decodeIfPresent(Bool.self, forKey: .allowDuplicates)
        let balanceColors = try c.decodeIfPresent(Bool.self, forKey: .balanceColors)
        let fixed = try c.decodeIfPresent(Bool.self, forKey: .fixed)
        let foil = try c.decodeIfPresent(Bool.self, forKey: .foil)
        let totalWeight = try c.decodeIfPresent(Int.self, forKey: .totalWeight)

        let cards: [MTGJSONBoosterSheetCard]?
        if c.contains(.cards) {
            let cardsContainer = try c.nestedContainer(keyedBy: MTGJSONAnyCodingKey.self, forKey: .cards)
            var list: [MTGJSONBoosterSheetCard] = []
            list.reserveCapacity(cardsContainer.allKeys.count)

            for key in cardsContainer.allKeys {
                let weight = try cardsContainer.decode(Int.self, forKey: key)
                list.append(MTGJSONBoosterSheetCard(uuid: key.stringValue, weight: weight))
            }
            cards = list.sorted { $0.uuid < $1.uuid }
        } else {
            cards = nil
        }

        // `name` is not decoded from JSON; it must be supplied externally.
        self = MTGJSONBoosterSheet(name: "", // default empty string here; should be set by caller after decoding
                                   allowDuplicates: allowDuplicates,
                                   balanceColors: balanceColors,
                                   fixed: fixed,
                                   foil: foil,
                                   totalWeight: totalWeight,
                                   cards: cards)
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)

        try c.encodeIfPresent(allowDuplicates, forKey: .allowDuplicates)
        try c.encodeIfPresent(balanceColors, forKey: .balanceColors)
        try c.encodeIfPresent(fixed, forKey: .fixed)
        try c.encodeIfPresent(foil, forKey: .foil)
        try c.encodeIfPresent(totalWeight, forKey: .totalWeight)

        if let cards {
            var cardsContainer = c.nestedContainer(keyedBy: MTGJSONAnyCodingKey.self, forKey: .cards)
            for entry in cards {
                try cardsContainer.encode(entry.weight, forKey: MTGJSONAnyCodingKey(entry.uuid))
            }
        }
    }
}

