//
//  Seller.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2020
//
import Foundation

struct Seller: Codable {

    let id: Int
    let username: String
    let avatarUrl: String?
    let following: Bool?
    let emblems: [String]
    let badges: [Badge]?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case avatarUrl = "avatar_url"
        case following = "following"
        case emblems = "emblems"
        case badges = "badges"
    }
}

struct Badge: Codable {
    let slug: String?
    let name: String?
}
