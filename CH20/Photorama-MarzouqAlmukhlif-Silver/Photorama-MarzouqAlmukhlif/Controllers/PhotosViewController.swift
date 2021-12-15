//
//  ViewController.swift
//  Photorama-MarzouqAlmukhlif
//
//  Created by Marzouq Almukhlif on 09/05/1443 AH.
//

import UIKit

class PhotosViewController: UIViewController {

  @IBOutlet var segmentedControl: UISegmentedControl!
  
  @IBOutlet private var imageView: UIImageView!
  var store: PhotoStore!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchPhotos(segmentedControl)
    
  }
  
  @IBAction func segmentTapped(_ sender: UISegmentedControl) {
    fetchPhotos(sender)
  }
  
  
  
  func fetchPhotos(_ sendr:UISegmentedControl) {
    switch sendr.selectedSegmentIndex {
    case 0:
      store.fetchRecentPhotos {
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
  case 1:
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
    default:
      print("\(sendr.selectedSegmentIndex)")
    }
  
    
  }
  
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

