import Foundation

public final class MTGJSONBoosterPack: Codable {
    public var contents: MTGJSONBoosterContents
    public var weight: Int

    public init(contents: MTGJSONBoosterContents, weight: Int) {
        self.contents = contents
        self.weight = weight
    }
}
