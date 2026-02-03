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

    @Test("Decode MTGJsonSetFile for set from MTGJSON (live fetch)")
    func decodeSetFile() async throws {
        let code = "OM2"
        // Live fetch from MTGJSON; this makes the test network-dependent.
        let url = URL(string: "https://mtgjson.com/api/v5/\(code).json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)

        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(for: request)
        let httpResponse: HTTPURLResponse = try #require(response as? HTTPURLResponse, "Expected an HTTPURLResponse")
        #expect((200..<300).contains(httpResponse.statusCode), "HTTP status not OK: \(httpResponse.statusCode)")

        let decoder = JSONDecoder()
        let setFile: MTGJsonClasses.MTGJSONSetFile = try decoder.decode(MTGJsonClasses.MTGJSONSetFile.self, from: data)

        print(setFile.data.isPartialPreview)
        
        // Basic sanity assertions; do not assume specific sizes as dataset may evolve.
        #expect(setFile.data.code.uppercased() == code)
        #expect(setFile.data.name?.isEmpty == false)
        #expect(setFile.data.cards.isEmpty == false || setFile.data.tokens?.isEmpty == false || setFile.data.isPartialPreview == true || setFile.data.sealedProduct?.isEmpty == false)


    }
    @Test("Decode all sets (live fetch)")
    func decodeAllSets() async throws {
        let sets: [String] = [
            "10E", "2ED", "2X2", "2XM", "30A", "3ED", "40K", "4BB", "4ED", "5DN",
            "5ED", "6ED", "7ED", "8ED", "9ED", "A25", "AA1", "AA2", "AA3", "AA4",
            "AACR", "AAFR", "ABLB", "ABRO", "ACLB", "ACMM", "ACR", "ADFT", "ADMU", "ADSK",
            "AECL", "AEOE", "AER", "AFC", "AFDN", "AFIC", "AFIN", "AFR", "AINR", "AJMP",
            "AKH", "AKHM", "AKR", "ALA", "ALCI", "ALL", "ALTC", "ALTR", "AMH1", "AMH2",
            "AMH3", "AMID", "AMKM", "AMOM", "ANA", "ANB", "ANEO", "AONE", "AOTJ", "APC",
            "ARB", "ARC", "ARN", "ASNC", "ASPM", "ASTX", "ATDM", "ATH", "ATLA", "ATLE",
            "ATQ", "AVOW", "AVR", "AWOE", "AZNR", "BBD", "BCHR", "BFZ", "BIG", "BLB",
            "BLC", "BNG", "BOK", "BOT", "BRB", "BRC", "BRO", "BRR", "BTD", "C13",
            "C14", "C15", "C16", "C17", "C18", "C19", "C20", "C21", "CC1", "CC2",
            "CED", "CEI", "CHK", "CHR", "CLB", "CLU", "CM1", "CM2", "CMA", "CMB1",
            "CMB2", "CMD", "CMM", "CMR", "CN2", "CNS", "CON", "CP1", "CP2", "CP3",
            "CSP", "CST", "DBL", "DCI", "DD1", "DD2", "DD3", "DDC", "DDD", "DDE",
            "DDF", "DDG", "DDH", "DDI", "DDJ", "DDK", "DDL", "DDM", "DDN", "DDO",
            "DDP", "DDQ", "DDR", "DDS", "DDT", "DDU", "DFT", "DGM", "DIS", "DKA",
            "DKM", "DMC", "DMR", "DMU", "DOM", "DPA", "DRB", "DRC", "DRK", "DSC",
            "DSK", "DST", "DTK", "DVD", "E01", "E02", "EA1", "EA2", "EA3", "ECC",
            "ECL", "ELD", "EMA", "EMN", "EOC", "EOE", "EOS", "EVE", "EVG", "EXO",
            "EXP", "F01", "F02", "F03", "F04", "F05", "F06", "F07", "F08", "F09",
            "F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "FBB",
            "FBRO", "FCA", "FCLU", "FDC", "FDMU", "FDN", "FEM", "FFDN", "FIC", "FIN",
            "FJ22", "FJ25", "FJMP", "FLTR", "FMOM", "FNM", "FONE", "FRF", "FTLA", "FUT",
            "FWB", "G00", "G01", "G02", "G03", "G04", "G05", "G06", "G07", "G08",
            "G09", "G10", "G11", "G17", "G18", "G99", "GDY", "GK1", "GK2", "GN2",
            "GN3", "GNT", "GPT", "GRN", "GS1", "GTC", "GVL", "H09", "H17", "H1R",
            "H2R", "HA1", "HA2", "HA3", "HA4", "HA5", "HA6", "HA7", "HBG", "HHO",
            "HML", "HOP", "HOU", "ICE", "IKO", "IMA", "INR", "INV", "ISD", "ITP",
            "J12", "J13", "J14", "J15", "J16", "J17", "J18", "J19", "J20", "J21",
            "J22", "J25", "JGP", "JMP", "JOU", "JP1", "JTLA", "JUD", "JVC", "KHC",
            "KHM", "KLD", "KLR", "KTK", "L12", "L13", "L14", "L15", "L16", "L17",
            "LCC", "LCI", "LEA", "LEB", "LEG", "LGN", "LMAR", "LRW", "LTC", "LTR",
            "M10", "M11", "M12", "M13", "M14", "M15", "M19", "M20", "M21", "M3C",
            "MACR", "MAFR", "MAR", "MAT", "MB1", "MB2", "MBRO", "MBS", "MCLB", "MD1",
            "MDMU", "ME1", "ME2", "ME3", "ME4", "MED", "MGB", "MH1", "MH2", "MH3",
            "MIC", "MID", "MIR", "MKC", "MKHM", "MKM", "MLTR", "MM2", "MM3", "MMA",
            "MMH2", "MMID", "MMQ", "MNEO", "MOC", "MOM", "MONE", "MOR", "MP2", "MPR",
            "MPS", "MRD", "MSC", "MSH", "MSNC", "MSTX", "MUL", "MVOW", "MZNR", "NCC",
            "NEC", "NEM", "NEO", "NPH", "O90P", "OAFC", "OAFR", "OANA", "OARC", "OC13",
            "OC14", "OC15", "OC16", "OC17", "OC18", "OC19", "OC20", "OC21", "OCLB", "OCM1",
            "OCMD", "ODY", "OE01", "OGW", "OHOP", "OLEP", "OLGC", "OM1", "OM2", "OMB",
            "OMIC", "ONC", "ONE", "ONS", "OPC2", "OPCA", "ORI", "OTC", "OTJ", "OTP",
            "OVNT", "OVOC", "P02", "P03", "P04", "P05", "P06", "P07", "P08", "P09",
            "P10", "P10E", "P11", "P15A", "P22", "P23", "P2HG", "P30A", "P30H", "P30M",
            "P30T", "P5DN", "P8ED", "P9ED", "PA1", "PAER", "PAFR", "PAKH", "PAL00", "PAL01",
            "PAL02", "PAL03", "PAL04", "PAL05", "PAL06", "PAL99", "PALA", "PALP", "PANA", "PAPC",
            "PARB", "PARL", "PAST", "PAVR", "PBBD", "PBFZ", "PBIG", "PBLB", "PBNG", "PBOK",
            "PBRO", "PC2", "PCA", "PCBB", "PCEL", "PCHK", "PCLB", "PCMD", "PCMP", "PCMR",
            "PCNS", "PCON", "PCSP", "PCY", "PD2", "PD3", "PDFT", "PDGM", "PDIS", "PDKA",
            "PDMU", "PDOM", "PDP10", "PDP12", "PDP13", "PDP14", "PDP15", "PDRC", "PDSK", "PDST",
            "PDTK", "PDTP", "PECL", "PELD", "PELP", "PEMN", "PEOE", "PEVE", "PEWK", "PEXO",
            "PF19", "PF20", "PF23", "PF24", "PF25", "PF26", "PFDN", "PFIN", "PFRF", "PFUT",
            "PGPT", "PGPX", "PGRN", "PGRU", "PGTC", "PH17", "PH18", "PH19", "PH20", "PH21",
            "PH22", "PH23", "PHEL", "PHOP", "PHOU", "PHPR", "PHTR", "PHUK", "PIDW", "PIKO",
            "PINV", "PIO", "PIP", "PISD", "PJ21", "PJAS", "PJJT", "PJOU", "PJSC", "PJSE",
            "PJUD", "PKHM", "PKLD", "PKTK", "PL21", "PL22", "PL23", "PL24", "PL25", "PL26",
            "PLC", "PLCI", "PLG20", "PLG21", "PLG22", "PLG24", "PLG25", "PLGM", "PLGN", "PLNY",
            "PLRW", "PLS", "PLST", "PLTC", "PLTR", "PM10", "PM11", "PM12", "PM13", "PM14",
            "PM15", "PM19", "PM20", "PM21", "PMAT", "PMBS", "PMDA", "PMEI", "PMH1", "PMH2",
            "PMH3", "PMIC", "PMID", "PMKM", "PMMQ", "PMOA", "PMOM", "PMOR", "PMPS", "PMPS06",
            "PMPS07", "PMPS08", "PMPS09", "PMPS10", "PMPS11", "PMRD", "PNAT", "PNCC", "PNEM", "PNEO",
            "PNPH", "PODY", "POGW", "PONE", "PONS", "POR", "PORI", "POTJ", "PPC1", "PPCY",
            "PPLC", "PPLS", "PPP1", "PPRO", "PPTK", "PR2", "PR23", "PRAV", "PRCQ", "PRED",
            "PRIX", "PRM", "PRNA", "PROE", "PRTR", "PRW2", "PRWK", "PS11", "PS14", "PS15",
            "PS16", "PS17", "PS18", "PS19", "PSAL", "PSCG", "PSDC", "PSDG", "PSHM", "PSNC",
            "PSOI", "PSOK", "PSOM", "PSPL", "PSPM", "PSS1", "PSS2", "PSS3", "PSS4", "PSS5",
            "PSSC", "PSTH", "PSTX", "PSUS", "PSVC", "PTBRO", "PTC", "PTDM", "PTDMU", "PTG",
            "PTHB", "PTHS", "PTK", "PTKDF", "PTLA", "PTMP", "PTOR", "PTSNC", "PTSP", "PTSR",
            "PUDS", "PULG", "PUMA", "PUNH", "PUNK", "PURL", "PUSG", "PUST", "PVAN", "PVOW",
            "PW11", "PW12", "PW21", "PW22", "PW23", "PW24", "PW25", "PW26", "PWAR", "PWCS",
            "PWOE", "PWOR", "PWOS", "PWWK", "PXLN", "PXTC", "PZ1", "PZ2", "PZA", "PZEN",
            "PZNR", "Q01", "Q02", "Q03", "Q04", "Q05", "Q06", "Q07", "Q08", "RAV", "REN",
            "REX", "RFIN", "RIN", "RIX", "RNA", "ROE", "RQS", "RTR", "RVR", "S00",
            "S99", "SBRO", "SCD", "SCG", "SCH", "SHM", "SIR", "SIS", "SKHM", "SLC",
            "SLCI", "SLD", "SLP", "SLU", "SLX", "SMH3", "SMID", "SMOM", "SNC", "SNEO",
            "SOA", "SOC", "SOI", "SOK", "SOM", "SOS", "SPE", "SPG", "SPM", "SS1",
            "SS2", "SS3", "SSTX", "STA", "STH", "STX", "SUM", "SUNF", "SVOW", "SZNR",
            "TBTH", "TD0", "TD2", "TDAG", "TDC", "TDM", "TFTH", "THB", "THP1", "THP2",
            "THP3", "THS", "TLA", "TLE", "TMC", "TMP", "TMT", "TOR", "TPR", "TSB",
            "TSP", "TSR", "UDS", "UGIN", "UGL", "ULG", "ULST", "UMA", "UND", "UNF",
            "UNH", "UNK", "USG", "UST", "V09", "V10", "V11", "V12", "V13", "V14",
            "V15", "V16", "V17", "VIS", "VMA", "VOC", "VOW", "W16", "W17", "WAR",
            "WC00", "WC01", "WC02", "WC03", "WC04", "WC97", "WC98", "WC99", "WDMU", "WFIN",
            "WHO", "WMC", "WMKM", "WMOM", "WOC", "WOE", "WONE", "WOT", "WTH", "WWK",
            "WWOE", "XANA", "XLN", "YBLB", "YBRO", "YDFT", "YDMU", "YDSK", "YECL", "YEOE",
            "YLCI", "YMID", "YMKM", "YNEO", "YONE", "YOTJ", "YSNC", "YTDM", "YWOE", "ZEN",
            "ZNC", "ZNE", "ZNR"
        ]
        
        for code in sets {
            let url = URL(string: "https://mtgjson.com/api/v5/\(code).json")!
            print(code)
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)

            let (data, response): (Data, URLResponse) = try await URLSession.shared.data(for: request)
            let httpResponse: HTTPURLResponse = try #require(response as? HTTPURLResponse, "Expected an HTTPURLResponse")
            #expect((200..<300).contains(httpResponse.statusCode), "HTTP status not OK: \(httpResponse.statusCode)")

            let decoder = JSONDecoder()
            let setFile: MTGJsonClasses.MTGJSONSetFile = try decoder.decode(MTGJsonClasses.MTGJSONSetFile.self, from: data)

            // Basic sanity assertions; do not assume specific sizes as dataset may evolve.
            #expect(setFile.data.code.uppercased() == code)
            #expect(setFile.data.name?.isEmpty == false)
            #expect(setFile.data.cards.isEmpty == false || setFile.data.tokens?.isEmpty == false || setFile.data.isPartialPreview == true || setFile.data.sealedProduct?.isEmpty == false || setFile.data.code == "AECL")
           
        }
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

