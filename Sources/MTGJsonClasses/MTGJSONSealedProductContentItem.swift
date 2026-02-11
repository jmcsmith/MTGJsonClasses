import Foundation

public struct MTGJSONSealedProductContentItem: Codable, Sendable {
    public var code: String?
    public var count: Int?
    public var foil: Bool?
    public var name: String?
    public var number: String?
    public var set: String?
    public var uuid: String?

    public init(
        count: Int? = nil,
        name: String? = nil,
        set: String? = nil,
        code: String? = nil,
        number: String? = nil,
        uuid: String? = nil,
        foil: Bool? = nil
    ) {
        self.count = count
        self.name = name
        self.set = set
        self.code = code
        self.number = number
        self.uuid = uuid
        self.foil = foil
    }
}
