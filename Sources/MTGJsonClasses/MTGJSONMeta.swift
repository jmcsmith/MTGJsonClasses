import Foundation

public final class MTGJSONMeta: Codable {
    public var date: String
    public var version: String

    public init(date: String, version: String) {
        self.date = date
        self.version = version
    }
}
