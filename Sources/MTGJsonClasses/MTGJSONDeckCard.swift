import Foundation

public struct MTGJSONDeckCard: Codable, Sendable {
    public let count: Int
    public let uuid: String
    public let isFoil: Bool?

    public init(count: Int, uuid: String, isFoil: Bool? = nil) {
        self.count = count
        self.uuid = uuid
        self.isFoil = isFoil
    }
}

