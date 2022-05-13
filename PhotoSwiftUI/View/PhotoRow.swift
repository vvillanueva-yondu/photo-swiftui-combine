//
//  PhotoRow.swift
//  PhotoSwiftUI
//
//  Created by Vince VIllanueva on 5/13/22.
//

import SwiftUI

struct PhotoRow: View {
    let photo: Photo
    var body: some View {
        HStack (spacing: 12) {
            let imageUrl = URL(string: photo.urls.regular)
            AsyncImage(
                url: imageUrl!,
               placeholder: { Text("Loading ...") },
               image: { Image(uiImage: $0).resizable() }
            )
            .aspectRatio(4/3, contentMode: .fit)
            .frame(idealHeight: UIScreen.main.bounds.width, alignment: Alignment.center)
        .padding(4)
        }
    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        let mockPhoto = Photo(id: "1", user: User.init(name: "John Doe"), urls: UrlType.init(regular: "Test"))
        PhotoRow(photo: mockPhoto)
    }
}
