import Foundation

public struct MTGJSONTokenPart: Codable, Sendable {
    public var faceAttribute: [String]?
    public var faceId: String?
    public var faceName: String?
    public var tokenType: String?
    public var uuid: String?
}

