//
//  MyMTGTests.swift
//  MyMTGTests
//
//  Created by Joseph Beaudoin on 8/29/25.
//

import Testing
@testable import MTGJsonClasses
import SwiftData
import Foundation

@Suite("MTGJSON DTO decoding")
struct MTGJSONDecodingTests {

    @Test("Decode MTGJsonSetFile for EOE from MTGJSON (live fetch)")
    func decodeSetFile() async throws {
        // Live fetch from MTGJSON; this makes the test network-dependent.
        let url = URL(string: "https://mtgjson.com/api/v5/EOE.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            Issue.record("Bad HTTP response fetching EOE.json")
            await #expect(Bool(false), "HTTP status not OK")
            return
        }

        let decoder = JSONDecoder()
        let setFile = try decoder.decode(MTGJsonSetFile.self, from: data)

        // Basic sanity assertions; do not assume specific sizes as dataset may evolve.
        await #expect(setFile.data.code?.uppercased() == "EOE")
        await #expect(setFile.data.name?.isEmpty == false)
        await #expect(setFile.data.baseSetSize != nil)
        await #expect(setFile.data.totalSetSize != nil)
        await #expect(setFile.data.cards?.isEmpty == false)
        await #expect(setFile.data.tokens?.isEmpty == false)

    }
    
    // Live network test; requires connectivity and the endpoint to be reachable.
//    @Test("Decode updates from live endpoint")
//    func decodeUpdatesFromLiveEndpoint() async throws {
//        
//        // Build the URL exactly as used in SettingsView (including scheme/host/port/path/query)
//        
//        // Determine the date to send. If never updated, default to a far past date (e.g., 1970-01-01).
//        let referenceDate: Date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.calendar = Calendar(identifier: .gregorian)
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        // Use U.S. Eastern Time (handles EST/EDT automatically)
//        dateFormatter.timeZone = TimeZone(identifier: "America/New_York")
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateString = dateFormatter.string(from: referenceDate)
//        
//        var comps = URLComponents()
//        comps.scheme = "http"
//        comps.host = "jbeaudoin.synology.me"
//        comps.port = 666
//        comps.path = "/updates"
//        comps.queryItems = [
//            URLQueryItem(name: "date", value: dateString)
//        ]
//        let url = try #require(comps.url, "Failed to build updates URL")
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//        let http = try #require(response as? HTTPURLResponse)
//        #expect((200..<300).contains(http.statusCode), "Expected 2xx status, got \(http.statusCode)")
//
//        // Decode the root response using the same strategy as SettingsView
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//
//        let updates = try decoder.decode(UpdatesResponse.self, from: data)
//
//        // Basic assertions on arrays existing (they may be empty, but should decode)
//        await #expect(updates.updateCards.count >= 0)
//        await #expect(updates.updateTokens.count >= 0)
//        await #expect(updates.updateSets.count >= 0)
//
//        // Attempt to decode all cardJSON payloads as MTGJsonCard
//        var decodedCardCount = 0
//        var firstDecodeError: Error?
//
//        for cu in await updates.updateCards {
//            guard let jsonData = await cu.cardJSON.data(using: .utf8) else {
//                continue
//            }
//            do {
//                let cardDecoder = JSONDecoder()
//                let _ = try cardDecoder.decode(MTGJsonCard.self, from: jsonData)
//                decodedCardCount += 1
//            } catch {
//                // Keep the first error to aid debugging if all fail
//                if firstDecodeError == nil { firstDecodeError = error }
//            }
//        }
//
//        // We expect at least one card to decode; if none did, surface the first error if available.
//        if decodedCardCount == 0, let err = firstDecodeError {
//            Issue.record("No cards decoded. First error: \(err)")
//        }
//        #expect(decodedCardCount > 0, "Expected at least one card in updateCards to decode")
//    }
}
