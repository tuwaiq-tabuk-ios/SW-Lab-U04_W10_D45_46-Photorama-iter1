//
//  File.swift
//  Photorama
//
//  Created by Aisha Ali on 12/12/21.
//

import UIKit


struct FlickrResponse: Codable {
    let photosInfo: FlickrPhotosResponse
    enum CodingKeys: String, CodingKey {
        case photosInfo = "photos"
    }
}


struct FlickrPhotosResponse: Codable {
    let photos: [Photo]
    enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}
