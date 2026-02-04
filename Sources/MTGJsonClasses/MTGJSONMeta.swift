import Foundation

public struct MTGJSONMeta: Codable, Sendable {
    public let date: String
    public let version: String

    public init(date: String, version: String) {
        self.date = date
        self.version = version
    }
}
