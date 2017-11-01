//
//  ImageModel.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/23/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
enum CodingKeys: String, CodingKey {
    case artist = "artist"
    case name = "name"
    case price = "price"
    case url = "url"
    case username = "userName"
    case userId = "userId"
    case place = "place"
    case style = "style"
    case metarial = "metarial"
    case size = "size"
    case artDesciption = "artDesciption"
    case favoriteCount = "favoriteCount"
    case viewCount = "viewCount"
}

struct ArtModel: Codable {
    let artist: UserModel?
    let name: String?
    let price: String?
    let url: String?
    let place: String?
    let style: String?
    let metarial: String?
    let size: String?
    let artDesciption: String?
    let favoriteCount: Int
    let viewCount: Int
    
    init(from decoder: Decoder) throws {
        let values  = try decoder.container(keyedBy: CodingKeys.self)
        artist      = try values.decode(UserModel.self, forKey: .artist)
        name        = try values.decode(String.self, forKey: .name)
        price       = try values.decode(String.self, forKey: .price)
        url         = try values.decode(String.self, forKey: .url)
        place       = try values.decode(String.self, forKey: .place)
        style       = try values.decode(String.self, forKey: .style)
        metarial    = try values.decode(String.self, forKey: .metarial)
        size        = try values.decode(String.self, forKey: .size)
        artDesciption  = try values.decode(String.self, forKey: .artDesciption)
        favoriteCount = try values.decode(Int.self, forKey: .favoriteCount)
        viewCount   = try values.decode(Int.self, forKey: .viewCount)
    }
}
