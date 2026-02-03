import Foundation

public final class MTGJSONSealedProductContentItem: Codable {
    public var count: Int?
    public var name: String?
    public var set: String?
    public var code: String?
    public var number: String?
    public var uuid: String?
    public var foil: Bool?

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
