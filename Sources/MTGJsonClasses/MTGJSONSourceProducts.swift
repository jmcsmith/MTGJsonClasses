import Foundation

public final class MTGJSONSourceProducts: Codable {
    public var foil: [String]?
    public var nonfoil: [String]?

    public init(foil: [String]? = nil, nonfoil: [String]? = nil) {
        self.foil = foil
        self.nonfoil = nonfoil
    }
}
