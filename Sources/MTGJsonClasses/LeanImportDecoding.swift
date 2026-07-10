import Foundation

public extension CodingUserInfoKey {
    /// Opt-in switch for bulk importers that don't need MTGJSON's heavyweight
    /// payload sections. Set `decoder.userInfo[.mtgjsonLeanImport] = true` to
    /// skip decoding `MTGJSONSetData.booster`, `.sealedProduct`, `.decks`,
    /// `MTGJSONCard.foreignData`, and `.purchaseUrls`. Skipped optional fields
    /// decode as `nil`; `purchaseUrls` decodes as an empty value. When the key
    /// is absent (the default), decoding behavior is unchanged.
    static let mtgjsonLeanImport = CodingUserInfoKey(rawValue: "mtgjsonLeanImport")!
}

extension Decoder {
    /// True when the decoder was configured with `.mtgjsonLeanImport`.
    var isLeanImport: Bool {
        (userInfo[.mtgjsonLeanImport] as? Bool) == true
    }
}
