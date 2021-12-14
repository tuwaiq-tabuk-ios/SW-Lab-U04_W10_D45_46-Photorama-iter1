//
//  PhotoDataSource.swift
//  Photorama_For_Yousef_ALBALAWI
//
//  Created by Yousef Albalawi on 09/05/1443 AH.
//



import UIKit
class PhotoDataSource: NSObject, UICollectionViewDataSource {
    var photos = [Photo]()
  
  
  func collectionView(_ collectionView: UICollectionView,
                          numberOfItemsInSection section: Int) -> Int {
          return photos.count
  }
      func collectionView(_ collectionView: UICollectionView,
                          cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let identifier = "PhotoCollectionViewCell"
          let cell =
              collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                 for: indexPath)
  return cell }
  
  
  
}
