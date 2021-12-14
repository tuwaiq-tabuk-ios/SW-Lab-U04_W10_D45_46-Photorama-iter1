//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Aisha Ali on 12/13/21.
//

import UIKit

class PhotoInfoViewController: UIViewController {
  
  var photo: Photo! {
    didSet {
      navigationItem.title = photo.title
    }
  }
  
  var store: PhotoStore!
  
  @IBOutlet var imageView: UIImageView!
  
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    store.fetchImage(for: photo) { (result) -> Void in
      switch result {
      case let .success(image):
        self.imageView.image = image
      case let .failure(error):
        print("Error fetching image for photo: \(error)")
      }
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}



