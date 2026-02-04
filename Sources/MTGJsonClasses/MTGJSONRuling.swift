import Foundation

public struct MTGJSONRuling: Codable, Sendable {
    public let date: String
    public let text: String

    public init(date: String, text: String) {
        self.date = date
        self.text = text
    }
}
