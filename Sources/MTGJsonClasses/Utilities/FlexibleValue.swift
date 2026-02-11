import Foundation

// A small wrapper that decodes either a JSON number or a string.
// Access via .intValue or .stringValue as needed.
struct StringOrInt: Decodable {
    var intValue: Int? { Int(stringValue) }
    let stringValue: String

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let i = try? container.decode(Int.self) {
            self.stringValue = String(i)
        } else if let s = try? container.decode(String.self) {
            self.stringValue = s
        } else if let d = try? container.decode(Double.self) {
            // In case some payloads use floating numbers; coerce if it's whole
            if d.rounded() == d {
                self.stringValue = String(Int(d))
            } else {
                self.stringValue = String(d)
            }
        } else {
            // Fallback to empty to avoid hard failure; you can throw instead if preferred
            self.stringValue = ""
        }
    }
}
