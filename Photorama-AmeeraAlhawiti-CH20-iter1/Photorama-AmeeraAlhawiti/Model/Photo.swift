//
//  Photo.swift
//  Photorama-AmeeraAlhawiti
//
//  Created by Ameera BA on 12/12/2021.
//

import Foundation

class Photo: Codable{
  let title: String
  let remoteURL: URL?
  let photoID: String
  let dateTaken: Date
  
  
  enum CodingKeys: String, CodingKey {
    case title
    case remoteURL = "url_z"
    case photoID = "id"
    case dateTaken = "datetaken"
  }
}
