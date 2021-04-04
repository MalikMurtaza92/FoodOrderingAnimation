//
//  CustomTabBar.swift
//  Food-Ordering-App
//
//  Created by macbook on 04/04/2021.
//

import UIKit
class CustomTabBar: UIView {
    
    private var shapeLayer: CAShapeLayer?
    private var centerButton: UIButton!
    private let numberOfItems: Int = 4
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepareButton()
        setupTabBarItems()
        setupUI()
    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        drawShapeLayer()
    }
    
    private func setupUI(){
        UIView.animate(withDuration: 1.0, delay: 0.6, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: []) {
        } completion: { (_) in
            
        }

    }
    
    private func drawShapeLayer(){
        self.backgroundColor = .clear
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.path = createPath()
        
        if let oldShapeLayer = self.shapeLayer{
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        }else{
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath{
        let height: CGFloat = frame.height * 0.7
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2

        path.move(to: CGPoint(x: 0, y: self.frame.height * 0.15))
        path.addLine(to: CGPoint(x: centerWidth - height * 1.5, y: 0))
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: centerWidth - (height * 0.18), y: -self.frame.height * 0.17),
                      controlPoint2: CGPoint(x: centerWidth - (height + 5), y: height))
        path.addCurve(to: CGPoint(x: centerWidth + height * 1.5, y: 0),
                      controlPoint1: CGPoint(x: centerWidth + (height + 5), y: height),
                      controlPoint2: CGPoint(x: centerWidth + (height * 0.18), y: -self.frame.height * 0.17))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height * 0.15))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
    
    private func prepareButton(){
        let halfWidth = frame.height * 0.85
        let width = halfWidth
        centerButton = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: width))
        var menuButtonFrame = centerButton.frame
        menuButtonFrame.origin.y = bounds.height - menuButtonFrame.height * 1.5
        //menuButtonFrame.origin.y = frame.height
        menuButtonFrame.origin.x = bounds.width/2 - menuButtonFrame.size.width/2
        centerButton.frame = menuButtonFrame

        centerButton.backgroundColor = UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 1)
        centerButton.layer.cornerRadius = menuButtonFrame.height/2
        
        centerButton.layer.shadowColor = UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 1).cgColor
        centerButton.layer.shadowOffset = .zero
        centerButton.layer.shadowRadius = 20.0
        centerButton.layer.shadowOpacity = 0.15
        centerButton.layer.borderColor = UIColor.white.cgColor
        centerButton.layer.borderWidth = 3.5
        
        centerButton.contentEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        centerButton.setImage(UIImage(named: "bag"), for: .normal)
        
        addSubview(centerButton)
        layoutIfNeeded()
    }

    
    func setupTabBarItems(){
        
//        let firstHalf = self.frame.width / 2
//        let firtSegment = firstHalf / 2
//
//
//        let frameHeight = frame.height
//        let buttonHeight = frameHeight * 0.3

//
//


        
        let offset = frame.height * 0.85
        let viewHalfWidth = frame.width / 2
        let totalHalfWidthWithOffset = (viewHalfWidth - ( offset / 2)) * 0.8
        let halfOfTotal = totalHalfWidthWithOffset / 2
        //addSubview(view)
        
        let buttonHeight = frame.height * 0.27
        let homeItem = UIButton(frame: CGRect(x: halfOfTotal / 2, y: (frame.height / 2) - buttonHeight / 2, width: buttonHeight, height: buttonHeight))
        homeItem.tintColor = UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 1)
        homeItem.setImage(UIImage(named: "home"), for: .normal)
        homeItem.layer.shadowColor = UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 1).cgColor
        homeItem.layer.shadowOffset = .zero
        homeItem.layer.shadowRadius = 12.0
        homeItem.layer.shadowOpacity = 0.7
        addSubview(homeItem)
        
        
        let bookItem = UIButton(frame: CGRect(x: (totalHalfWidthWithOffset + halfOfTotal) / 2, y: (frame.height / 2) - buttonHeight / 2, width: buttonHeight, height: buttonHeight))
        bookItem.tintColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1)
        bookItem.setImage(UIImage(named: "book"), for: .normal)
        addSubview(bookItem)
        
        let secondSegmentStart = (frame.width) / 2 + offset
        
        let bookmark = UIButton(frame: CGRect(x: secondSegmentStart , y: (frame.height / 2) - buttonHeight / 2, width: buttonHeight, height: buttonHeight))
        bookmark.tintColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1)
        bookmark.setImage(UIImage(named: "bookmark"), for: .normal)
        addSubview(bookmark)
        
        let secondHalf = (secondSegmentStart + frame.width) / 2
        let notification = UIButton(frame: CGRect(x: secondHalf, y: (frame.height / 2) - buttonHeight / 2, width: buttonHeight, height: buttonHeight))
        notification.tintColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1)
        notification.setImage(UIImage(named: "bell"), for: .normal)
        addSubview(notification)
        layoutIfNeeded()
        
    }
}
