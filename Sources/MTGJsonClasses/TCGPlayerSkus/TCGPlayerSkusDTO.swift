//
//  TCGPlayerSkusDTO.swift
//  MyMTG
//
//  Created by Joseph Beaudoin on 9/22/25.
//

import Foundation

/// DTOs for decoding TCGPlayer SKUs response
///
/// Expected JSON shape:
/// {
///   "meta": { "date": "YYYY-MM-DD", "version": "..." },
///   "data": { "<productUUID>": [ { ...SKU fields... } ] }
/// }
///
/// Note: The example JSON provided shows a trailing comma inside one array;
/// trailing commas are not valid JSON. Ensure the source JSON is valid when decoding.
public final class TCGPlayerSkusDTO: Decodable {
    public let meta: Meta
    public let data: [String: [SKU]]
}

public final class Meta: Decodable {
    public let date: String
    public let version: String
}

public final class SKU: Decodable {
    public let condition: String
    public let finish: String? // Optional in some entries
    public let language: String
    public let printing: String
    public let productId: String
    public let skuId: String
}
