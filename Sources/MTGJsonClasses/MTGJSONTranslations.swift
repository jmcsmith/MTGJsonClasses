import Foundation

public struct MTGJSONTranslations: Codable, Sendable {
    public var chineseSimplified: String?
    public var chineseTraditional: String?
    public var french: String?
    public var german: String?
    public var italian: String?
    public var japanese: String?
    public var korean: String?
    public var portugueseBrazil: String?
    public var russian: String?
    public var spanish: String?

    private enum CodingKeys: String, CodingKey {
        case chineseSimplified = "Chinese Simplified"
        case chineseTraditional = "Chinese Traditional"
        case french = "French"
        case german = "German"
        case italian = "Italian"
        case japanese = "Japanese"
        case korean = "Korean"
        case portugueseBrazil = "Portuguese (Brazil)"
        case russian = "Russian"
        case spanish = "Spanish"
    }
}

