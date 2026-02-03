import Foundation

public final class MTGJSONBoosterSheetCard: Codable {
    public var uuid: String
    public var weight: Int

    public init(uuid: String, weight: Int) {
        self.uuid = uuid
        self.weight = weight
    }
}
