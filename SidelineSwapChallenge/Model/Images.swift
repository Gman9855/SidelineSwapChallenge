//
//  Images.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Images: Codable {

	let id: Int
	let thumbUrl: String?
	let smallUrl: String?
	let largeUrl: String?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case thumbUrl = "thumb_url"
		case smallUrl = "small_url"
		case largeUrl = "large_url"
	}
}
