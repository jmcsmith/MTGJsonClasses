import Foundation

public struct MTGJSONBoosterPack: Codable, Sendable {
    public let contents: MTGJSONBoosterContents
    public let weight: Int

    public init(contents: MTGJSONBoosterContents, weight: Int) {
        self.contents = contents
        self.weight = weight
    }
}
