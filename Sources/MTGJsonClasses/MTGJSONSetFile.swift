import Foundation

public final class MTGJSONSetFile: Codable {
    public var meta: MTGJSONMeta
    public var data: MTGJSONSetData

    public init(meta: MTGJSONMeta, data: MTGJSONSetData) {
        self.meta = meta
        self.data = data
    }
}
