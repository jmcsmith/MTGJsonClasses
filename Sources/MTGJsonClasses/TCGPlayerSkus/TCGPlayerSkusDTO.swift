import Foundation

/// DTO for decoding TCGplayer SKUs response.
/// Supports `meta` and a `data` dictionary keyed by card UUID.
public final class TCGPlayerSkusDTO: Decodable {
    public let meta: Meta
    public let data: [String: [SKU]]

    private enum CodingKeys: String, CodingKey { case meta, data }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.meta = try container.decode(Meta.self, forKey: .meta)
        self.data = try container.decode([String: [SKU]].self, forKey: .data)
    }
}

/// Metadata for the SKUs payload.
public final class Meta: Decodable {
    public let date: String
    public let version: String
}

/// A single TCGplayer SKU entry.
public final class SKU: Decodable {
    public let condition: Condition
    public let finish: Finish? // Optional because some payloads omit this field
    public let language: Language
    public let printing: Printing
    public let productId: Int
    public let skuId: Int

    private enum CodingKeys: String, CodingKey {
        case condition, finish, language, printing, productId, skuId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.condition = try container.decode(Condition.self, forKey: .condition)
        self.finish = try container.decodeIfPresent(Finish.self, forKey: .finish)
        self.language = try container.decode(Language.self, forKey: .language)
        self.printing = try container.decode(Printing.self, forKey: .printing)
        self.productId = try SKU.decodeFlexibleInt(from: container, forKey: .productId)
        self.skuId = try SKU.decodeFlexibleInt(from: container, forKey: .skuId)
    }

    private static func decodeFlexibleInt(from container: KeyedDecodingContainer<CodingKeys>, forKey key: CodingKeys) throws -> Int {
        if let intVal = try? container.decode(Int.self, forKey: key) {
            return intVal
        }
        if let stringVal = try? container.decode(String.self, forKey: key), let intVal = Int(stringVal) {
            return intVal
        }
        if let doubleVal = try? container.decode(Double.self, forKey: key) {
            return Int(doubleVal)
        }
        throw DecodingError.dataCorruptedError(forKey: key, in: container, debugDescription: "Expected Int or numeric String for \(key.rawValue)")
    }

    // MARK: - Value Types

    public enum Condition: Decodable, Equatable {
        case nearMint
        case lightlyPlayed
        case moderatelyPlayed
        case heavilyPlayed
        case damaged
        case unknown(String)

        public init(from decoder: Decoder) throws {
            let raw = try decoder.singleValueContainer().decode(String.self)
            switch raw.uppercased() {
            case "NEAR MINT": self = .nearMint
            case "LIGHTLY PLAYED": self = .lightlyPlayed
            case "MODERATELY PLAYED": self = .moderatelyPlayed
            case "HEAVILY PLAYED": self = .heavilyPlayed
            case "DAMAGED": self = .damaged
            default: self = .unknown(raw)
            }
        }
    }

    public enum Finish: Decodable, Equatable {
        case foil
        case nonFoil
        case foilEtched
        case unknown(String)

        public init(from decoder: Decoder) throws {
            let raw = try decoder.singleValueContainer().decode(String.self)
            switch raw.uppercased() {
            case "FOIL": self = .foil
            case "NON FOIL": self = .nonFoil
            case "FOIL ETCHED": self = .foilEtched
            default: self = .unknown(raw)
            }
        }
    }

    public enum Language: Decodable, Equatable {
        case english
        case chineseSimplified
        case chineseTraditional
        case french
        case german
        case italian
        case japanese
        case korean
        case portugueseBrazil
        case russian
        case spanish
        case unknown(String)

        public init(from decoder: Decoder) throws {
            let raw = try decoder.singleValueContainer().decode(String.self)
            switch raw.uppercased() {
            case "ENGLISH": self = .english
            case "CHINESE SIMPLIFIED": self = .chineseSimplified
            case "CHINESE TRADITIONAL": self = .chineseTraditional
            case "FRENCH": self = .french
            case "GERMAN": self = .german
            case "ITALIAN": self = .italian
            case "JAPANESE": self = .japanese
            case "KOREAN": self = .korean
            case "PORTUGUESE BRAZIL": self = .portugueseBrazil
            case "RUSSIAN": self = .russian
            case "SPANISH": self = .spanish
            default: self = .unknown(raw)
            }
        }
    }

    public enum Printing: Decodable, Equatable {
        case foil
        case nonFoil
        case unknown(String)

        public init(from decoder: Decoder) throws {
            let raw = try decoder.singleValueContainer().decode(String.self)
            switch raw.uppercased() {
            case "FOIL": self = .foil
            case "NON FOIL": self = .nonFoil
            default: self = .unknown(raw)
            }
        }
    }
}
