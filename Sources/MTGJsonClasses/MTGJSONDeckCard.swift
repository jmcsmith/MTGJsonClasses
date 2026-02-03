import Foundation

public final class MTGJSONDeckCard: Codable {
    public var count: Int
    public var uuid: String
    public var isFoil: Bool?

    public init(count: Int, uuid: String, isFoil: Bool? = nil) {
        self.count = count
        self.uuid = uuid
        self.isFoil = isFoil
    }
}
