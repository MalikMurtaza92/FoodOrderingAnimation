//
//  CardLayoutViewController.swift
//  Food-Ordering-App
//
//  Created by Murtaza Mehmood on 17/03/2021.
//

import UIKit

class CardLayoutViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

}

extension CardLayoutViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .lightGray
        return cell
    }
    
    
}

class CardCollectionViewLayout: UICollectionViewLayout{
    
    let padding: CGFloat = 12
    var numberOfItems: Int = 0
    var itemSize: CGSize{
        guard let cv = collectionView else{return .zero}
        
        return CGSize(width: 150, height: cv.frame.height * 0.8)
    }
    
    override var collectionViewContentSize: CGSize{
        return CGSize(width: itemSize.width * CGFloat(numberOfItems) + (CGFloat(numberOfItems + 1) * padding), height: collectionView!.frame.height)
    }
    
    var cache: [UICollectionViewLayoutAttributes] = []
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else{return nil}
        let scaleRate: CGFloat = 0.7
        let minAlpha: CFloat = 0
        for attributes in cache{
            if attributes.frame.intersects(rect){
                print(collectionView.contentOffset.x)
                let distance = collectionView.frame.width
                let itemOffset = attributes.center.x - collectionView.contentOffset.x
                let position = itemOffset / distance - 0.5
                let scaleFactor = scaleRate - 0.1 * abs(position)
                let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
                
                let translationTransform: CGAffineTransform

                let width = collectionView.frame.width
                let translationX = -(width * padding * position)
                translationTransform = CGAffineTransform(translationX: translationX, y: 0)
                attributes.transform = scaleTransform
            }
        }
        return cache.filter{$0.frame.intersects(rect)}
    }
    
    override func prepare() {
        guard let cv = collectionView else{return}
        numberOfItems = cv.numberOfItems(inSection: 0)
        let centerY: CGFloat = cv.frame.height / 2
        var centerX: CGFloat = (itemSize.width / 2) + padding
        for item in 0..<numberOfItems{
            let indexPath = IndexPath(row: item, section: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)

            attribute.size = itemSize
            attribute.center = CGPoint(x: centerX, y: centerY)
            cache.append(attribute)
            centerX += itemSize.width + padding
        }
        
        
    }
}
