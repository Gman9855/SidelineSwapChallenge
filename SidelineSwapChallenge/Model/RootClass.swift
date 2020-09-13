//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct RootClass: Codable {

	let items: [Item]
	let meta: Meta

	private enum CodingKeys: String, CodingKey {
		case items = "data"
		case meta = "meta"
	}
}
