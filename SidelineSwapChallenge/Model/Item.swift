//
//  Data.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Item: Codable {

	let id: Int
	let state: String?
	let name: String?
	let category1: String?
	let category2: String?
	let price: Double
	let listPrice: Double
	let url: String?
	let favoritersCount: Int
	let favorite: Bool?
	let syncGmc: Bool
	let createdAt: String?
	let updatedAt: String?
	let label: String?
	let actions: [String]?
	let categories: [Categories]
	let images: [Images]
	let seller: Seller?
	let primaryImage: PrimaryImage

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case state = "state"
		case name = "name"
		case category1 = "category_1"
		case category2 = "category_2"
		case price = "price"
		case listPrice = "list_price"
		case url = "url"
		case favoritersCount = "favoriters_count"
		case favorite = "favorite"
		case syncGmc = "sync_gmc"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case label = "label"
		case actions = "actions"
		case categories = "categories"
		case images = "images"
		case seller = "seller"
		case primaryImage = "primary_image"
	}
}
