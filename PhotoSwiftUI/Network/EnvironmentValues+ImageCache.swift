//
//  EnvironmentValues+ImageCache.swift
//  InfinitListSwiftUI
//
//  Created by Vince VIllanueva on 5/13/22.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
