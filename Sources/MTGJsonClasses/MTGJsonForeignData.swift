import Foundation

struct MTGJsonForeignData: Decodable {
    let flavorText: String?
    let identifiers: MTGJsonForeignIdentifiers?
    let language: String?
    let multiverseId: Int?
    let name: String?
    let text: String?
    let type: String?
    let faceName: String?
}
