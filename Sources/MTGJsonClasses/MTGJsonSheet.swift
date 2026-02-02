import Foundation

struct MTGJsonSheet: Decodable {
    let balanceColors: Bool?
    let cards: [String: Int]?
    let foil: Bool?
    let totalWeight: Int?
}
