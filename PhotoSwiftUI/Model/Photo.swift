//
//  Photo.swift
//  PhotoSwiftUI
//
//  Created by Vince VIllanueva on 5/13/22.
//

import Foundation

struct Photo: Decodable, Identifiable {
    let id: String
    let user: User
    let urls: UrlType
    
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case urls
    }
}
