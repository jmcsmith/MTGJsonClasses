import Foundation

public final class MTGJSONForeignData: Codable {
    public var language: String
    public var name: String?
    public var type: String?
    public var text: String?
    public var flavorText: String?
    public var multiverseId: Int?
    public var uuid: String?
    public var identifiers: MTGJSONIdentifiers?

    public init(
        language: String,
        name: String? = nil,
        type: String? = nil,
        text: String? = nil,
        flavorText: String? = nil,
        multiverseId: Int? = nil,
        uuid: String? = nil,
        identifiers: MTGJSONIdentifiers? = nil
    ) {
        self.language = language
        self.name = name
        self.type = type
        self.text = text
        self.flavorText = flavorText
        self.multiverseId = multiverseId
        self.uuid = uuid
        self.identifiers = identifiers
    }
}
