import Testing
@testable import MTGJsonClasses
import Foundation

@Suite("Lean import decoding")
struct LeanImportDecodingTests {

    /// A minimal valid set file whose heavyweight sections (`booster`,
    /// `sealedProduct`, `decks`, card `foreignData`, card `purchaseUrls`)
    /// deliberately contain values of the wrong type. A lean decode must
    /// succeed because it never touches those keys; a default decode must
    /// throw because it does.
    private static let fixtureWithPoisonedHeavyFields = Data("""
    {
        "meta": { "date": "2026-07-09", "version": "5.2.2" },
        "data": {
            "baseSetSize": 1,
            "totalSetSize": 1,
            "code": "TST",
            "keyruneCode": "TST",
            "name": "Test Set",
            "type": "expansion",
            "releaseDate": "2026-07-09",
            "isFoilOnly": false,
            "isOnlineOnly": false,
            "translations": {},
            "booster": 12345,
            "sealedProduct": "not an array",
            "decks": "not an array",
            "tokens": [],
            "cards": [
                {
                    "availability": ["paper"],
                    "borderColor": "black",
                    "colorIdentity": [],
                    "colors": [],
                    "convertedManaCost": 1,
                    "finishes": ["nonfoil"],
                    "frameVersion": "2015",
                    "identifiers": {},
                    "language": "English",
                    "layout": "normal",
                    "legalities": {},
                    "manaValue": 1,
                    "name": "Test Card",
                    "number": "1",
                    "rarity": "common",
                    "setCode": "TST",
                    "subtypes": [],
                    "supertypes": [],
                    "type": "Instant",
                    "types": ["Instant"],
                    "uuid": "00000000-0000-0000-0000-000000000000",
                    "foreignData": "not an array",
                    "purchaseUrls": "not an object"
                }
            ]
        }
    }
    """.utf8)

    @Test("Lean decode skips heavy fields entirely")
    func leanDecodeSkipsHeavyFields() throws {
        let decoder = JSONDecoder()
        decoder.userInfo[.mtgjsonLeanImport] = true

        let setFile = try decoder.decode(MTGJSONSetFile.self, from: Self.fixtureWithPoisonedHeavyFields)

        #expect(setFile.data.booster == nil)
        #expect(setFile.data.sealedProduct == nil)
        #expect(setFile.data.decks == nil)

        let card = try #require(setFile.data.cards.first)
        #expect(card.foreignData == nil)
        #expect(card.purchaseUrls.tcgplayer == nil)
        #expect(card.name == "Test Card")
        #expect(card.uuid == "00000000-0000-0000-0000-000000000000")
    }

    @Test("Default decode still reads heavy fields")
    func defaultDecodeReadsHeavyFields() throws {
        let decoder = JSONDecoder()
        #expect(throws: DecodingError.self) {
            try decoder.decode(MTGJSONSetFile.self, from: Self.fixtureWithPoisonedHeavyFields)
        }
    }

    @Test("Default decode of valid heavy fields is unchanged")
    func defaultDecodeValidHeavyFields() throws {
        var json = String(data: Self.fixtureWithPoisonedHeavyFields, encoding: .utf8)!
        json = json
            .replacing("\"booster\": 12345,", with: "")
            .replacing("\"sealedProduct\": \"not an array\",", with: "")
            .replacing("\"decks\": \"not an array\",", with: "")
            .replacing("\"foreignData\": \"not an array\",", with: """
                "foreignData": [
                    { "language": "German", "name": "Testkarte", "uuid": "00000000-0000-0000-0000-000000000001", "identifiers": {} }
                ],
            """)
            .replacing("\"purchaseUrls\": \"not an object\"", with: "\"purchaseUrls\": { \"tcgplayer\": \"https://example.com\" }")

        let setFile = try JSONDecoder().decode(MTGJSONSetFile.self, from: Data(json.utf8))
        let card = try #require(setFile.data.cards.first)
        #expect(card.foreignData?.count == 1)
        #expect(card.foreignData?.first?.language == "German")
        #expect(card.purchaseUrls.tcgplayer == "https://example.com")
    }
}
