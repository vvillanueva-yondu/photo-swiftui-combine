//
//  ContentView.swift
//  PhotoSwiftUI
//
//  Created by Vince VIllanueva on 5/12/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject private var photoViewModel = PhotoViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(photoViewModel.photos, id: \.id) { user in
                    NavigationLink(
                        destination: DetailView(user: user)) {
                        PhotoRow(photo: user)
                    }
                }
                LoaderView(isFailed: photoViewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: onTapLoadView)
            }
            .navigationTitle("Photo List")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func fetchData() {
        photoViewModel.getPhotos()
    }
    
    private func onTapLoadView() {
        // enable tap to reload
        if photoViewModel.isRequestFailed {
            photoViewModel.isRequestFailed = false
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
