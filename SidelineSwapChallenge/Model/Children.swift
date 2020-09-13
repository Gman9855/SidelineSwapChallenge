//
//  Children.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Children: Codable {

	let id: Int?
	let name: String?
	let slug: String?
	let display: String?
	let fullName: String?
	let url: String?
	let iconUrl: String?
	let pinnedImageUrl: String?
	let count: Int?
	let countTruncated: Bool?
	let hasChildren: Bool?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case slug = "slug"
		case display = "display"
		case fullName = "full_name"
		case url = "url"
		case iconUrl = "icon_url"
		case pinnedImageUrl = "pinned_image_url"
		case count = "count"
		case countTruncated = "count_truncated"
		case hasChildren = "has_children"
    }
}
