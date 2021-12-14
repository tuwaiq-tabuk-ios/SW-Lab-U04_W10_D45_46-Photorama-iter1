//
//  Photo.swift
//  Photorama_MohaamedALatawi
//
//  Created by محمد العطوي on 08/05/1443 AH.
//

import Foundation

class Photo : Codable {
  let title : String
  let remoteURL : URL?
  let photoID : String
  let dateTaken: Date
  
  enum CodingKeys: String, CodingKey {
          case title
          case remoteURL = "url_z"
          case photoID = "id"
          case dateTaken = "datetaken"
  }
}
