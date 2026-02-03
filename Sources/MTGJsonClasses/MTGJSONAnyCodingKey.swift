import Foundation

/// CodingKey that can represent arbitrary JSON object keys.
/// Used as an implementation detail to decode JSON objects into arrays of classes
/// (so your public model types don't need Dictionary properties).
public struct MTGJSONAnyCodingKey: CodingKey {
    public var stringValue: String
    public var intValue: Int?

    public init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    public init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }

    public init(_ string: String) {
        self.stringValue = string
        self.intValue = nil
    }
}
