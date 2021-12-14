//
//  PhotosViewController.swift
//  Photorama_For_Yousef_ALBALAWI
//
//  Created by Yousef Albalawi on 09/05/1443 AH.
//

import UIKit

class PhotosViewController: UIViewController {

  @IBOutlet private var imageView: UIImageView!
  var store: PhotoStore!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      store.fetchInterestingPhotos {
             (photosResult) in
             switch photosResult {
             case let .success(photos):
                 print("Successfully found \(photos.count) photos.")
              if let firstPhoto = photos.first {
                            self.updateImageView(for: firstPhoto)
                        }
             case let .failure(error):
                 print("Error fetching interesting photos: \(error)")
             }
     }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

  
  func updateImageView(for photo: Photo) {
      store.fetchImage(for: photo) {
          (imageResult) in
          switch imageResult {
          case let .success(image):
              self.imageView.image = image
          case let .failure(error):
              print("Error downloading image: \(error)")
          }
  } }

  
}
