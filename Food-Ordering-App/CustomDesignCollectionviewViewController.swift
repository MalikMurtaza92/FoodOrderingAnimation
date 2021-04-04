//
//  CustomDesignCollectionviewViewController.swift
//  Food-Ordering-App
//
//  Created by Murtaza Mehmood on 14/03/2021.
//

import UIKit

protocol PinterestCollectionViewLayoutDelegate{
    func collectionView(_ colllectionView: UICollectionView,heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class PinterestImageCollectionCell: UICollectionViewCell{
    
    @IBOutlet weak var image: UIImageView!
}

class CustomDesignCollectionviewViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var photos: [UIImageView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        photos.append(UIImageView(image: UIImage(named: "1")))
        photos.append(UIImageView(image: UIImage(named: "2")))
        photos.append(UIImageView(image: UIImage(named: "3")))
        photos.append(UIImageView(image: UIImage(named: "4")))
        photos.append(UIImageView(image: UIImage(named: "5")))
        photos.append(UIImageView(image: UIImage(named: "6")))
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout =  collectionView.collectionViewLayout as? PinterestCollectionViewLayout{
            layout.delegate = self
        }
    }

}
extension CustomDesignCollectionviewViewController: PinterestCollectionViewLayoutDelegate, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PinterestImageCollectionCell
        cell.image.image = photos[indexPath.row].image
        return cell
    }
    
    
    func collectionView(_ colllectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return photos[indexPath.row].image?.size.height ?? 180
    }
    
    
}

class PinterestCollectionViewLayout: UICollectionViewLayout{
    
    var delegate: PinterestCollectionViewLayoutDelegate?
    
    // 1

    // 2
    private let numberOfColumns = 2
    private let cellPadding: CGFloat = 6

    // 3
    private var cache: [UICollectionViewLayoutAttributes] = []

    // 4
    private var contentHeight: CGFloat = 0

    private var contentWidth: CGFloat {
      guard let collectionView = collectionView else {
        return 0
      }
      let insets = collectionView.contentInset
      return collectionView.bounds.width - (insets.left + insets.right)
    }

    // 5
    override var collectionViewContentSize: CGSize {
      return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes  = [UICollectionViewLayoutAttributes]()
        for attribute in cache{
            if attribute.frame.intersects(rect){
                attributes.append(attribute)
            }
        }
        return attributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    override func prepare() {
        
        guard
          cache.isEmpty,
          let collectionView = collectionView
          else {
            return
        }
        // 2
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
          xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
          
        // 3
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
          let indexPath = IndexPath(item: item, section: 0)
            
          // 4
          let photoHeight = delegate?.collectionView(
            collectionView,
            heightForPhotoAtIndexPath: indexPath) ?? 180
          let height = cellPadding * 2 + photoHeight
          let frame = CGRect(x: xOffset[column],
                             y: yOffset[column],
                             width: columnWidth,
                             height: height)
          let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
          // 5
          let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
          attributes.frame = insetFrame
          cache.append(attributes)
            
          // 6
          contentHeight = max(contentHeight, frame.maxY)
          yOffset[column] = yOffset[column] + height
          
          column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
}
