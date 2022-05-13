//
//  ApiError.swift
//  InfinitListSwiftUI
//
//  Created by Vince VIllanueva on 5/12/22.
//

import Foundation

enum ApiError: Error {
  case statusCode
  case decoding
  case invalidImage
  case invalidURL
  case other(Error)
  
  static func map(_ error: Error) -> ApiError {
    return (error as? ApiError) ?? .other(error)
  }
}
