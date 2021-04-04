//
//  ViewController.swift
//  Food-Ordering-App
//
//  Created by Murtaza Mehmood on 13/03/2021.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var searchBarView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    func setupView(){
        recipeCollectionView.backgroundColor = .clear
        menuButton.backgroundColor = UIColor.white
        menuButton.layer.cornerRadius = 10.0
        menuButton.layer.shadowColor = UIColor.lightGray.cgColor
        menuButton.layer.masksToBounds = false
        menuButton.layer.shadowRadius = 4
        menuButton.layer.shadowOpacity = 0.6
        menuButton.layer.shadowOffset = .zero
        profileButton.layer.cornerRadius = 10.0
        filterButton.layer.cornerRadius = 15.0
        searchBarView.layer.cornerRadius = 15.0
        searchBarView.layer.borderWidth = 5
        searchBarView.layer.borderColor = UIColor.white.cgColor
        collectionView.backgroundColor = .clear
        
        searchTxt.attributedText = NSAttributedString(string: "Search food...", attributes: [NSAttributedString.Key.foregroundColor:UIColor(red: 39/255, green: 45/255, blue: 47/255, alpha: 1)])

    }

    func animateComponents(){
        
        menuButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        profileButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        titleLabel.transform = CGAffineTransform(translationX: 0, y: -150)
        searchBarView.transform = CGAffineTransform(translationX: 0, y: -150)
        filterButton.transform = CGAffineTransform(translationX: 0, y: -150)
        collectionView.transform = CGAffineTransform(translationX: 0, y: -150)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 4, options: .curveEaseInOut) {
            self.titleLabel.transform = .identity
            self.searchBarView.transform = .identity
            self.filterButton.transform = .identity
            self.collectionView.transform = .identity
            self.recipeCollectionView.transform = .identity
        } completion: { (_) in
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.recipeCollectionView.delegate = self
            self.recipeCollectionView.dataSource = self
            UIView.animate(withDuration: 0.2) {
                self.menuButton.transform = .identity
                self.profileButton.transform = .identity
                
            } completion: { (_) in
                self.view.layoutIfNeeded()
            }

            self.view.layoutIfNeeded()
        }


        
    }
    


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recipeCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCollectionViewCell
            cell.layer.transform = CATransform3D(m11: 0.1, m12: 0, m13: 0, m14: 0,
                                                 m21: 0, m22: 0.1, m23: 0, m24: 0,
                                                 m31: 0, m32: 0, m33: 0.1, m34: 0,
                                                 m41: 0, m42: 0, m43: 0, m44: 0.1)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                cell.layer.transform = CATransform3D(m11: 1, m12: 0, m13: 0, m14: 0,
                                                     m21: 0, m22: 1, m23: 0, m24: 0,
                                                     m31: 0, m32: 0, m33: 1, m34: 0,
                                                     m41: 0, m42: 0, m43: 0, m44: 1)
            } completion: { (_) in
                cell.layer.layoutIfNeeded()
            }
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodCollectionViewCell

            if indexPath.row == 0{
                cell.cellView.backgroundColor = UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 1)
            }else{
                cell.cellView.layer.borderColor = UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 1).cgColor
                cell.cellView.layer.borderWidth = 1.5
                cell.cellView.backgroundColor =  .white
            }
            if indexPath.row == 0{
                cell.titleLabel.text = "🍔 Fast food"
                
            }else if indexPath.row == 1{
                cell.titleLabel.text = "🍓 Fruit item"
            }else{
                cell.titleLabel.text = "🥦 Vegitables"
            }
            cell.layer.transform = CATransform3D(m11: 0.1, m12: 0, m13: 0, m14: 0,
                                                 m21: 0, m22: 0.1, m23: 0, m24: 0,
                                                 m31: 0, m32: 0, m33: 0.1, m34: 0,
                                                 m41: 0, m42: 0, m43: 0, m44: 0.1)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
                cell.layer.transform = CATransform3D(m11: 1, m12: 0, m13: 0, m14: 0,
                                                     m21: 0, m22: 1, m23: 0, m24: 0,
                                                     m31: 0, m32: 0, m33: 1, m34: 0,
                                                     m41: 0, m42: 0, m43: 0, m44: 1)
            } completion: { (_) in
                cell.layer.layoutIfNeeded()
            }

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == recipeCollectionView{
            print(collectionView.frame.height)
            return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height * 0.85)
        }else{
            return CGSize(width: 120, height: self.collectionView.frame.height * 0.5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == recipeCollectionView{
            let inset = collectionView.frame.height * 0.3
            print(inset)
            return UIEdgeInsets(top: 0, left: 40, bottom: 120, right: 40)
        }else{
            return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        }
    }
    
}


class FoodCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 15.0
    }
    
}


class RecipeCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 15.0
    }
    
}
