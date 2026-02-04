import Foundation

public struct MTGJSONBooster: Codable, Sendable {
    public var arena: MTGJSONBoosterConfiguration?
    public var boxTopper: MTGJSONBoosterConfiguration?
    public var collector: MTGJSONBoosterConfiguration?
    public var collectorSample: MTGJSONBoosterConfiguration?
    public var defaultBooster: MTGJSONBoosterConfiguration?
    public var draft: MTGJSONBoosterConfiguration?
    public var jumpstart: MTGJSONBoosterConfiguration?
    public var play: MTGJSONBoosterConfiguration?
    public var prerelease: MTGJSONBoosterConfiguration?
    public var set: MTGJSONBoosterConfiguration?
    public var starter: MTGJSONBoosterConfiguration?

    private enum CodingKeys: String, CodingKey {
        case arena
        case boxTopper = "box-topper"
        case collector
        case collectorSample = "collector-sample"
        case defaultBooster = "default"
        case draft
        case jumpstart
        case play
        case prerelease
        case set
        case starter
    }
}
