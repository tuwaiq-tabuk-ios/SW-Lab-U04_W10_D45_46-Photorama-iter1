//
//  PhotoCollectionViewCell.swift
//  WebServices"Reema.Mousa"
//
//  Created by Reema Mousa on 09/05/1443 AH.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  
  
  func update(displaying image: UIImage?) {
      if let imageToDisplay = image {
          spinner.stopAnimating()
          imageView.image = imageToDisplay
      } else {
          spinner.startAnimating()
          imageView.image = nil
      }
  }
  
}
