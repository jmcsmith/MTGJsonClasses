import Foundation

public struct MTGJSONForeignData: Codable, Sendable {

    public var faceName: String?
    public var flavorText: String?
    public var identifiers: MTGJSONIdentifiers
    public var language: String
    public var name: String
    public var text: String?
    public var type: String?
    public var uuid: String

    public init(
        language: String,
        name: String,
        uuid: String,
        identifiers: MTGJSONIdentifiers,
        faceName: String? = nil,
        flavorText: String? = nil,
        text: String? = nil,
        type: String? = nil
    ) {
        self.language = language
        self.name = name
        self.uuid = uuid
        self.identifiers = identifiers
        self.faceName = faceName
        self.flavorText = flavorText
        self.text = text
        self.type = type
    }
}

