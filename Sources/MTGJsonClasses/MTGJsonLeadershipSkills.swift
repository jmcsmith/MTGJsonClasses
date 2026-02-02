import Foundation

struct MTGJsonLeadershipSkills: Decodable {
    let brawl: Bool?
    let commander: Bool?
    let oathbreaker: Bool?

    // If MTGJSON provides additional flags like "pauperCommander",
    // you can add them here and map via CodingKeys if needed.
    // Example:
    // let pauperCommander: Bool?
    //
    // private enum CodingKeys: String, CodingKey {
    //     case brawl, commander, oathbreaker
    //     case pauperCommander
    // }
}
