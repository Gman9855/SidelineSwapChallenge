//
//  SidelineSwapAPI.swift
//  SidelineSwapChallenge
//
//  Created by Gershy Lev on 9/13/20.
//  Copyright © 2020 Gershy Lev. All rights reserved.
//

import Foundation

class SidelineSwapAPI {
    
    private let baseURL = "https://api.staging.sidelineswap.com/v1/"
    
    func getItems(searchTerm: String, page: Int, result: @escaping ([Item]?, Error?, Paging?) -> ()) {
        var urlComponents = URLComponents(string: baseURL + "/facet_items")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: searchTerm),
            URLQueryItem(name: "page", value: String(page))
        ]
        let request = URLRequest(url: urlComponents.url!)
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in

            guard let data = data else {
                result(nil, error, nil)
                return
            }
            do {
                let root = try JSONDecoder().decode(RootClass.self, from: data)
                result(root.items, nil, root.meta.paging)
            } catch {
                result(nil, error, nil)
                print(error)
            }
        }
        task.resume()
    }
}
