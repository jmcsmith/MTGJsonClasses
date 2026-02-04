import Foundation

public struct MTGJSONSetFile: Codable, Sendable {
    public var data: MTGJSONSetData
    public var meta: MTGJSONMeta

    public init(meta: MTGJSONMeta, data: MTGJSONSetData) {
        self.meta = meta
        self.data = data
    }
}

