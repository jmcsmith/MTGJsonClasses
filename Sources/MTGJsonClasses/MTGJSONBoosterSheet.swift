import Foundation

public final class MTGJSONBoosterSheet: Codable {
    /// Not in JSON — it's the object key from the parent `sheets` map.
    public var name: String = ""

    public var allowDuplicates: Bool?
    public var balanceColors: Bool?
    public var fixed: Bool?
    public var foil: Bool?
    public var totalWeight: Int?

    public var cards: [MTGJSONBoosterSheetCard]?

    private enum CodingKeys: String, CodingKey {
        case allowDuplicates, balanceColors, fixed, foil, totalWeight, cards
    }

    public required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        self.allowDuplicates = try c.decodeIfPresent(Bool.self, forKey: .allowDuplicates)
        self.balanceColors = try c.decodeIfPresent(Bool.self, forKey: .balanceColors)
        self.fixed = try c.decodeIfPresent(Bool.self, forKey: .fixed)
        self.foil = try c.decodeIfPresent(Bool.self, forKey: .foil)
        self.totalWeight = try c.decodeIfPresent(Int.self, forKey: .totalWeight)

        // `cards` is a JSON object: { "<uuid>": <weight>, ... }
        if c.contains(.cards) {
            let cardsContainer = try c.nestedContainer(keyedBy: MTGJSONAnyCodingKey.self, forKey: .cards)
            var list: [MTGJSONBoosterSheetCard] = []
            list.reserveCapacity(cardsContainer.allKeys.count)

            for key in cardsContainer.allKeys {
                let weight = try cardsContainer.decode(Int.self, forKey: key)
                list.append(MTGJSONBoosterSheetCard(uuid: key.stringValue, weight: weight))
            }

            self.cards = list.sorted { $0.uuid < $1.uuid }
        } else {
            self.cards = nil
        }
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
