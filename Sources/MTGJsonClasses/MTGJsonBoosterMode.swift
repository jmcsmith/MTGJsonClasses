import Foundation

struct MTGJsonBoosterMode: Decodable {
    let boosters: [MTGJsonBoosterItem]?
    let boostersTotalWeight: Int?
    let name: String?
    let sheets: [String: MTGJsonSheet]?
    let sourceSetCodes: [String]?
    let fixed: [String: Int]?
}
