//
//  PhotoCollectionViewCell.swift
//  Photorama_For_Yousef_ALBALAWI
//
//  Created by Yousef Albalawi on 09/05/1443 AH.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var spinner: UIActivityIndicatorView!

  
  
  
  func update(displaying image: UIImage?) {
      if let imageToDisplay = image {
          spinner.stopAnimating()
          imageView.image = imageToDisplay
      } else {
          spinner.startAnimating()
          imageView.image = nil
      }
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let identifier = "PhotoCollectionViewCell"
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,for: indexPath) as! PhotoCollectionViewCell
    cell.update(displaying: nil)
    return cell }

}
