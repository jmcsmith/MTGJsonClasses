import Foundation

public final class MTGJSONBoosterConfiguration: Codable {
    public var name: String?
    public var languages: [String]?
    public var boostersTotalWeight: Int?
    public var sourceSetCodes: [String]?

    public var boosters: [MTGJSONBoosterPack]
    public var sheets: [MTGJSONBoosterSheet]

    private enum CodingKeys: String, CodingKey {
        case name, languages, boostersTotalWeight, sourceSetCodes
        case boosters, sheets
    }

    public init(
        name: String? = nil,
        languages: [String]? = nil,
        boostersTotalWeight: Int? = nil,
        sourceSetCodes: [String]? = nil,
        boosters: [MTGJSONBoosterPack] = [],
        sheets: [MTGJSONBoosterSheet] = []
    ) {
        self.name = name
        self.languages = languages
        self.boostersTotalWeight = boostersTotalWeight
        self.sourceSetCodes = sourceSetCodes
        self.boosters = boosters
        self.sheets = sheets
    }

    public required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try c.decodeIfPresent(String.self, forKey: .name)
        self.languages = try c.decodeIfPresent([String].self, forKey: .languages)
        self.boostersTotalWeight = try c.decodeIfPresent(Int.self, forKey: .boostersTotalWeight)
        self.sourceSetCodes = try c.decodeIfPresent([String].self, forKey: .sourceSetCodes)

        self.boosters = try c.decode([MTGJSONBoosterPack].self, forKey: .boosters)

        // `sheets` is a JSON object keyed by sheet name
        let sheetsContainer = try c.nestedContainer(keyedBy: MTGJSONAnyCodingKey.self, forKey: .sheets)
        var sheetsArray: [MTGJSONBoosterSheet] = []
        sheetsArray.reserveCapacity(sheetsContainer.allKeys.count)

        for key in sheetsContainer.allKeys {
            let sheet = try sheetsContainer.decode(MTGJSONBoosterSheet.self, forKey: key)
            sheet.name = key.stringValue
            sheetsArray.append(sheet)
        }

        self.sheets = sheetsArray.sorted { $0.name < $1.name }
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)

        try c.encodeIfPresent(name, forKey: .name)
        try c.encodeIfPresent(languages, forKey: .languages)
        try c.encodeIfPresent(boostersTotalWeight, forKey: .boostersTotalWeight)
        try c.encodeIfPresent(sourceSetCodes, forKey: .sourceSetCodes)

        try c.encode(boosters, forKey: .boosters)

        var sheetsContainer = c.nestedContainer(keyedBy: MTGJSONAnyCodingKey.self, forKey: .sheets)
        for sheet in sheets {
            try sheetsContainer.encode(sheet, forKey: MTGJSONAnyCodingKey(sheet.name))
        }
    }
}
