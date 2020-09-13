//
//  Query.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Query: Codable {

	let q: String?
	let state: [String]?
	let facets: Facets
	let sort: String?

	private enum CodingKeys: String, CodingKey {
		case q = "q"
		case state = "state"
		case facets = "facets"
		case sort = "sort"
	}
}
