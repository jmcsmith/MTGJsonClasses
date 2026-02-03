import Foundation

public final class MTGJSONTokenPart: Codable {
    public var uuid: String?
    public var faceId: String?
    public var faceName: String?
    public var tokenType: String?
    public var faceAttribute: [String]?
}
