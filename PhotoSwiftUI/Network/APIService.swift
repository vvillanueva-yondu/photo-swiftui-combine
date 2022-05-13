//
//  APIService.swift
//  PhotoSwiftUI
//
//  Created by Vince VIllanueva on 5/13/22.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    func getPhotos() -> AnyPublisher<[Photo], Error> {
        var components = URLComponents(string: "https://api.unsplash.com/photos")!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "ABSJ-QrlUTMPzI6wVahZccAoLeLExaxSGHAgMUqLFhI"),
        ]
        
        let request = URLRequest(url: components.url!, timeoutInterval: 5)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
