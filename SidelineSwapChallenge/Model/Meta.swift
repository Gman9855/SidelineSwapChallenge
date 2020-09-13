//
//  Meta.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Meta: Codable {

	let query: Query
	let facets: [Facets]
	let paging: Paging

	private enum CodingKeys: String, CodingKey {
		case query = "query"
		case facets = "facets"
		case paging = "paging"
	}
}
