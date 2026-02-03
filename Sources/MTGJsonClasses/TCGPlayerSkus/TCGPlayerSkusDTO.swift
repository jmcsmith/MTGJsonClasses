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
    let meta: Meta
    let data: [String: [SKU]]



}
public final class Meta: Decodable {
    let date: String
    let version: String
}

public final class SKU: Decodable {
    let condition: String
    let finish: String? // Optional in some entries
    let language: String
    let printing: String
    let productId: String
    let skuId: String
}
