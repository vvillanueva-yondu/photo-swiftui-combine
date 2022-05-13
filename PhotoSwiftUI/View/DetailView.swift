//
//  DetailView.swift
//  PhotoSwiftUI
//
//  Created by Vince VIllanueva on 5/13/22.
//

import SwiftUI

struct DetailView: View {
    let user: Photo
    var body: some View {
        let imageUrl = URL(string: user.urls.regular)
        VStack (spacing: 2) {
            Text("Photographer: " + user.user.name)
            AsyncImage(
                url: imageUrl!,
               placeholder: { Text("Loading ...") },
               image: { Image(uiImage: $0).resizable() }
            ).aspectRatio(contentMode: .fit)
        }
    }
}
