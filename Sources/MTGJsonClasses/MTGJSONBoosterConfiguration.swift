import Foundation

public struct MTGJSONBoosterConfiguration: Codable, Sendable {
    public let name: String?
    public let languages: [String]?
    public let boostersTotalWeight: Int?
    public let sourceSetCodes: [String]?

    public let boosters: [MTGJSONBoosterPack]
    public let sheets: [MTGJSONBoosterSheet]

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

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        let name = try c.decodeIfPresent(String.self, forKey: .name)
        let languages = try c.decodeIfPresent([String].self, forKey: .languages)
        let boostersTotalWeight = try c.decodeIfPresent(Int.self, forKey: .boostersTotalWeight)
        let sourceSetCodes = try c.decodeIfPresent([String].self, forKey: .sourceSetCodes)

        let boosters = try c.decode([MTGJSONBoosterPack].self, forKey: .boosters)

        // `sheets` is a JSON object keyed by sheet name
        let sheetsContainer = try c.nestedContainer(keyedBy: MTGJSONAnyCodingKey.self, forKey: .sheets)
        var sheetsArray: [MTGJSONBoosterSheet] = []
        sheetsArray.reserveCapacity(sheetsContainer.allKeys.count)

        for key in sheetsContainer.allKeys {
            var sheet = try sheetsContainer.decode(MTGJSONBoosterSheet.self, forKey: key)
            sheet.name = key.stringValue
            sheetsArray.append(sheet)
        }

        let sheets = sheetsArray.sorted { $0.name < $1.name }

        self = MTGJSONBoosterConfiguration(
            name: name,
            languages: languages,
            boostersTotalWeight: boostersTotalWeight,
            sourceSetCodes: sourceSetCodes,
            boosters: boosters,
            sheets: sheets
        )
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

