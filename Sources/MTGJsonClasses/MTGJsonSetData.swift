import Foundation

struct MTGJsonSetData: Decodable {
    let baseSetSize: Int?
    let block: String?
    let cards: [MTGJsonCard]?
    let code: String?
    let totalSetSize: Int?
    let mtgoCode: String?
    let languages: [String]?
    let cardsphereSetId: StringOrInt?
    let tcgplayerGroupId: StringOrInt?
    let isFoilOnly: Bool?
    let isOnlineOnly: Bool?
    let type: String?
    let tokens: [MTGJsonToken]?
    let name: String?
    let mcmName: String?
    let mcmId: StringOrInt?
    let isNonFoilOnly: Bool?
    let releaseDate: String?
    let keyruneCode: String?
    let tokenSetCode: String?
    let isForeignOnly: Bool?
    let parentCode: String?
    let mcmIdExtras: StringOrInt?
    let isPartialPreview: Bool?
}
