import Foundation

public final class MTGJSONSetFile: Codable {
    public var data: MTGJSONSetData
    public var meta: MTGJSONMeta

    public init(meta: MTGJSONMeta, data: MTGJSONSetData) {
        self.meta = meta
        self.data = data
    }
}
