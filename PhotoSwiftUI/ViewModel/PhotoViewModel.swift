//
//  PhotoViewModel.swift
//  PhotoSwiftUI
//
//  Created by Vince VIllanueva on 5/13/22.
//

import Foundation

import Combine

class PhotoViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    @Published var isRequestFailed = false
    private var cancellable: AnyCancellable?
    
    func getPhotos() {
        cancellable = APIService.shared.getPhotos()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { photos in
                self.photos.append(contentsOf: photos)
            }

    }
}
