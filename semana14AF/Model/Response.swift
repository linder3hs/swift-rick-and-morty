//
//  File.swift
//  semana14AF
//
//  Created by Linder Hassinger on 10/06/21.
//

import Foundation

struct Response: Codable {
    let results: [Results]
//    let info: [Info]
}

struct Results: Codable {
    let id: Int
    let name: String
    let status: String
    let type: String
    let gender: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case status = "status"
        case type = "type"
        case gender = "gender"
        case image = "image"
    }
    
}

//struct Info: Codable {
//    let count: Int
//    let pages: Int
//    let next: String
//    let prev: String
//}
