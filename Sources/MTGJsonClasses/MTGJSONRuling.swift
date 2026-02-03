import Foundation

public final class MTGJSONRuling: Codable {
    public var date: String
    public var text: String

    public init(date: String, text: String) {
        self.date = date
        self.text = text
    }
}
