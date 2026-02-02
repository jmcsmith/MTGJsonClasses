import Foundation

struct MTGJsonBoosterItem: Decodable {
    let contents: [String: Int]?
    let weight: Int?
}
