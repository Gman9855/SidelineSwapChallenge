//
//  Paging.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Paging: Codable {

	let totalCount: Int?
	let totalCountTruncated: Bool?
	let totalPages: Int?
	let pageSize: Int?
	let page: Int
	let hasNextPage: Bool

	private enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case totalCountTruncated = "total_count_truncated"
		case totalPages = "total_pages"
		case pageSize = "page_size"
		case page = "page"
		case hasNextPage = "has_next_page"
	}
}
