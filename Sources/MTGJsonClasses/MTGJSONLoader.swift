import Foundation

public enum MTGJSONLoader {
    public static func loadSet(from url: URL) throws -> MTGJSONSetFile {
        try JSONDecoder().decode(MTGJSONSetFile.self, from: Data(contentsOf: url))
    }
}
