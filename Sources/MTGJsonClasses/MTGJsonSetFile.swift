import Foundation

nonisolated struct MTGJsonSetFile: Decodable {
    let meta: MTGJsonMeta
    let data: MTGJsonSetData
}
