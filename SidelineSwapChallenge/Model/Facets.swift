//
//  Facets.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Facets: Codable {

    let name: String?
    let slug: String?
    let countTruncated: Bool?
    let children: [Children]?

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case slug = "slug"
        case countTruncated = "count_truncated"
        case children = "children"
    }
}
