//
//  ImageZoomViewController.swift
//  PhotosExample
//
//  Created by 백래훈 on 2023/02/16.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController{
    
    var asset: PHAsset!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    //MARK: - @IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Methods
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = PHImageRequestOptions()
        options.resizeMode = .exact
        
        imageManager.requestImage(
            for: asset,
            targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
            contentMode: .aspectFill,
            options: options,
            resultHandler: { image, _ in
                self.imageView.image = image
            })
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

extension ImageZoomViewController: UIScrollViewDelegate {
    
}
