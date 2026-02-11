import Foundation

public struct MTGJSONDeck: Codable, Sendable {
    public var cards: [MTGJSONDeckCard]?
    public var code: String?
    public var commander: [MTGJSONDeckCard]?
    public var displayCommander: [MTGJSONDeckCard]?
    public var mainBoard: [MTGJSONDeckCard]?
    public var name: String
    public var planes: [MTGJSONDeckCard]?
    public var releaseDate: String?
    public var schemes: [MTGJSONDeckCard]?
    public var sealedProductUuids: [String]?
    public var sideBoard: [MTGJSONDeckCard]?
    public var sourceSetCodes: [String]?
    public var tokens: [MTGJSONDeckCard]?
    public var type: String?

    public init(
        code: String? = nil,
        name: String,
        type: String? = nil,
        releaseDate: String? = nil,
        sourceSetCodes: [String]? = nil,
        sealedProductUuids: [String]? = nil,
        commander: [MTGJSONDeckCard]? = nil,
        displayCommander: [MTGJSONDeckCard]? = nil,
        mainBoard: [MTGJSONDeckCard]? = nil,
        sideBoard: [MTGJSONDeckCard]? = nil,
        cards: [MTGJSONDeckCard]? = nil,
        planes: [MTGJSONDeckCard]? = nil,
        schemes: [MTGJSONDeckCard]? = nil,
        tokens: [MTGJSONDeckCard]? = nil
    ) {
        self.code = code
        self.name = name
        self.type = type
        self.releaseDate = releaseDate
        self.sourceSetCodes = sourceSetCodes
        self.sealedProductUuids = sealedProductUuids
        self.commander = commander
        self.displayCommander = displayCommander
        self.mainBoard = mainBoard
        self.sideBoard = sideBoard
        self.cards = cards
        self.planes = planes
        self.schemes = schemes
        self.tokens = tokens
    }
}
