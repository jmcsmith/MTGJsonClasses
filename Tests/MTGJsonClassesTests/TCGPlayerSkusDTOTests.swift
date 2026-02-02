//import Testing
//@testable import MTGJsonClasses
//import SwiftData
//import Foundation
//
//@Suite("TCGPlayerSkusDTO decoding")
//struct TCGPlayerSkusDTOTests {
//
//    @Test("Decodes minimal valid sample")
//    func decodesSample() async throws {
//        
//        let jsonData = """
//         {
//             "meta": {
//                 "date": "2025-09-20",
//                 "version": "5.2.2+20250920"
//             },
//             "data": {
//                 "01359a41-06e6-5262-9fd0-ccad985803a0": [
//                     {
//                         "condition": "NEAR MINT",
//                         "finish": "FOIL ETCHED",
//                         "language": "ENGLISH",
//                         "printing": "FOIL",
//                         "productId": 504636,
//                         "skuId": 7267191
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "finish": "FOIL ETCHED",
//                         "language": "ENGLISH",
//                         "printing": "FOIL",
//                         "productId": 504636,
//                         "skuId": 7267192
//                     },
//                 ],
//                 "00010d56-fe38-5e35-8aed-518019aa36a5": [
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "ENGLISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 3045711
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "ENGLISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 3045712
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "ENGLISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 3045713
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "ENGLISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 3045714
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "ENGLISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 3045715
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "CHINESE SIMPLIFIED",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653760
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "CHINESE SIMPLIFIED",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653761
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "CHINESE SIMPLIFIED",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653762
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "CHINESE SIMPLIFIED",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653763
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "CHINESE SIMPLIFIED",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653764
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "CHINESE TRADITIONAL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653765
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "CHINESE TRADITIONAL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653766
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "CHINESE TRADITIONAL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653767
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "CHINESE TRADITIONAL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653768
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "CHINESE TRADITIONAL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653769
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "FRENCH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653770
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "FRENCH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653771
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "FRENCH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653772
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "FRENCH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653773
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "FRENCH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653774
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "GERMAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653775
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "GERMAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653776
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "GERMAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653777
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "GERMAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653778
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "GERMAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653779
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "ITALIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653780
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "ITALIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653781
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "ITALIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653782
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "ITALIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653783
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "ITALIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653784
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "JAPANESE",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653785
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "JAPANESE",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653786
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "JAPANESE",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653787
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "JAPANESE",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653788
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "JAPANESE",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653789
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "KOREAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653790
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "KOREAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653791
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "KOREAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653792
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "KOREAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653793
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "KOREAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653794
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "PORTUGUESE BRAZIL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653795
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "PORTUGUESE BRAZIL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653796
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "PORTUGUESE BRAZIL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653797
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "PORTUGUESE BRAZIL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653798
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "PORTUGUESE BRAZIL",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653799
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "RUSSIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653800
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "RUSSIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653801
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "RUSSIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653802
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "RUSSIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653803
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "RUSSIAN",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653804
//                     },
//                     {
//                         "condition": "NEAR MINT",
//                         "language": "SPANISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653805
//                     },
//                     {
//                         "condition": "LIGHTLY PLAYED",
//                         "language": "SPANISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653806
//                     },
//                     {
//                         "condition": "MODERATELY PLAYED",
//                         "language": "SPANISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653807
//                     },
//                     {
//                         "condition": "HEAVILY PLAYED",
//                         "language": "SPANISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653808
//                     },
//                     {
//                         "condition": "DAMAGED",
//                         "language": "SPANISH",
//                         "printing": "FOIL",
//                         "productId": 111268,
//                         "skuId": 7653809
//                     }
//                 ]
//             }
//         }
//        """.data(using: .utf8)!
//
//        let decoder = JSONDecoder()
//        let dto = try decoder.decode(TCGPlayerSkusDTO.self, from: jsonData)
//
//        await #expect(dto.meta.date == "2025-09-20")
//        await #expect(dto.meta.version == "5.2.2+20250920")
//
//        await #expect(dto.data.keys.contains("01359a41-06e6-5262-9fd0-ccad985803a0"))
//        await #expect(dto.data.keys.contains("00010d56-fe38-5e35-8aed-518019aa36a5"))
//
//        let listA = try #require(dto.data["01359a41-06e6-5262-9fd0-ccad985803a0"])
//        await #expect(listA.count == 2)
//        if let first = listA.first {
//            switch first.condition { case .nearMint: break; default: Issue.record("Condition mismatch") }
//            switch first.finish { case .foilEtched?: break; default: Issue.record("Finish mismatch") }
//            switch first.language { case .english: break; default: Issue.record("Language mismatch") }
//            switch first.printing { case .foil: break; default: Issue.record("Printing mismatch") }
//            await #expect(first.productId == 504636)
//            await #expect(first.skuId == 7267191)
//        } else {
//            Issue.record("Missing first item in listA")
//        }
//
//        let listB = try #require(dto.data["00010d56-fe38-5e35-8aed-518019aa36a5"])
//        await #expect(listB.count == 55)
//        if let firstNoFinish = listB.first {
//            await #expect(firstNoFinish.finish == nil)
//            switch firstNoFinish.condition { case .nearMint: break; default: Issue.record("Expected NEAR MINT for first item in listB") }
//            switch firstNoFinish.language { case .english: break; default: Issue.record("Expected ENGLISH for first item in listB") }
//        }
//    }
//
//    @Test("Unknown values fall back to .unknown")
//    func unknownValuesFallback() async throws {
//        let jsonData = """
//        {
//          "meta": { "date": "2025-01-01", "version": "1.0" },
//          "data": {
//            "key": [
//              { "condition": "MINT", "finish": "SUPER FOIL", "language": "KLINGON", "printing": "HOLOGRAPHIC", "productId": 1, "skuId": 2 }
//            ]
//          }
//        }
//        """.data(using: .utf8)!
//
//        let dto = try JSONDecoder().decode(TCGPlayerSkusDTO.self, from: jsonData)
//        let list = try #require(dto.data["key"])
//        let sku = try #require(list.first)
//
//        // Ensure unknowns are preserved
//        switch sku.condition { case .unknown("MINT"): break; default: Issue.record("Expected unknown condition 'MINT'") }
//        switch sku.finish { case .unknown("SUPER FOIL")?: break; default: Issue.record("Expected unknown finish 'SUPER FOIL'") }
//        switch sku.language { case .unknown("KLINGON"): break; default: Issue.record("Expected unknown language 'KLINGON'") }
//        switch sku.printing { case .unknown("HOLOGRAPHIC"): break; default: Issue.record("Expected unknown printing 'HOLOGRAPHIC'") }
//
//        await #expect(sku.productId == 1)
//        await #expect(sku.skuId == 2)
//    }
//}
