//
//  Categories.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Categories: Codable {

	let id: Int
	let uuid: String?
	let slug: String?
	let name: String?
	let fullName: String?
	let relatable: Bool
	let showPopularModels: Bool
	let iconUrl: String?
	let imageUrl: String?
	let hasModels: Bool?
	let titleName: String?
	let url: String?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case uuid = "uuid"
		case slug = "slug"
		case name = "name"
		case fullName = "full_name"
		case relatable = "relatable"
		case showPopularModels = "show_popular_models"
		case iconUrl = "icon_url"
		case imageUrl = "image_url"
		case hasModels = "has_models"
		case titleName = "title_name"
		case url = "url"
	}
}
