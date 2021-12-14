//
//  PhotosViewController.swift
//  Photorama_For_Yousef_ALBALAWI
//
//  Created by Yousef Albalawi on 09/05/1443 AH.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate{
  
  
  
  @IBOutlet var collectionView: UICollectionView!
  
  var store: PhotoStore!
  let photoDataSource = PhotoDataSource()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = photoDataSource
    collectionView.delegate = self
    
    store.fetchInterestingPhotos {
      (photosResult) -> Void in
      switch photosResult {
      case let .success(photos):
        
        print("Successfully found \(photos.count) photos.")
        
        self.photoDataSource.photos = photos
      case let .failure(error):
        print("Error fetching interesting photos: \(error)")
        self.photoDataSource.photos.removeAll()
      }
      self.collectionView.reloadSections(IndexSet(integer: 0))
    } }
  
  // Do any additional setup after loading the view.
  
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
  
  func collectionView(_ collectionView: UICollectionView,
                      willDisplay cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath) {
    let photo = photoDataSource.photos[indexPath.row]
    // Download the image data, which could take some time
    store.fetchImage(for: photo) { (result) -> Void in
      // The index path for the photo might have changed between the
      // time the request started and finished, so find the most
      // recent index path
      guard let photoIndex = self.photoDataSource.photos.firstIndex(of: photo),
            case let .success(image) = result else {
        return
      }
      let photoIndexPath = IndexPath(item: photoIndex, section: 0)
      // When the request finishes, find the current cell for this photo
      if let cell = self.collectionView.cellForItem(at: photoIndexPath)
          as? PhotoCollectionViewCell {
        cell.update(displaying: image)
        
      }
    } }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "showPhoto":
      if let selectedIndexPath =
          collectionView.indexPathsForSelectedItems?.first {
        let photo = photoDataSource.photos[selectedIndexPath.row]
        let destinationVC = segue.destination as! PhotoInfoViewController
        destinationVC.photo = photo
        destinationVC.store = store
      } default:
        preconditionFailure("Unexpected segue identifier.")
    }
  }
  
}
