//
//  SecondViewController.swift
//  Food-Ordering-App
//
//  Created by macbook on 04/04/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var customView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCustomView()
    }
    
    func setupCustomView(){
        
        print(customView.frame.height * 0.3)
        print(customView.frame.height)
        let height: CGFloat = customView.frame.height * 0.7
        let path = UIBezierPath()
        let centerWidth = self.customView.frame.width / 2

        path.move(to: CGPoint(x: 0, y: customView.frame.height * 0.15))
        path.addLine(to: CGPoint(x: centerWidth - height * 2, y: 0))
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: centerWidth - (height * 0.18), y: -customView.frame.height * 0.17),
                      controlPoint2: CGPoint(x: centerWidth - (height + 5), y: height))
        path.addCurve(to: CGPoint(x: centerWidth + height * 2, y: 0),
                      controlPoint1: CGPoint(x: centerWidth + (height + 5), y: height),
                      controlPoint2: CGPoint(x: centerWidth + (height * 0.18), y: -customView.frame.height * 0.17))
        path.addLine(to: CGPoint(x: customView.frame.width, y: customView.frame.height * 0.15))
        path.addLine(to: CGPoint(x: customView.frame.width, y: customView.frame.height))
        path.addLine(to: CGPoint(x: 0, y: customView.frame.height))
        path.close()
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.purple.cgColor
        customView.layer.insertSublayer(layer, at: 0)
        
    }

}

/*
 path.addLine(to: CGPoint(x: (centerWidth - height ), y: 0))
//        path.addCurve(to: CGPoint(x: centerWidth, y: height - 40),
//                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height - 40))
//        path.addCurve(to: CGPoint(x: (centerWidth + height ), y: 0),
//                      controlPoint1: CGPoint(x: centerWidth + 35, y: height - 40), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
 
 path.addLine(to: CGPoint(x: customView.frame.width, y: 0))
 path.addLine(to: CGPoint(x: customView.frame.width, y: customView.frame.height))
 path.addLine(to: CGPoint(x: 0, y: customView.frame.height))
 */


/*
 path.addLine(to: CGPoint(x: (centerWidth - height ), y: 0))
 path.addCurve(to: CGPoint(x: centerWidth, y: height - 40),
               controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height - 40))
 path.addCurve(to: CGPoint(x: (centerWidth + height ), y: 0),
               controlPoint1: CGPoint(x: centerWidth + 35, y: height - 40), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
 path.addLine(to: CGPoint(x: customView.frame.width, y: 0))
 path.addLine(to: CGPoint(x: customView.frame.width, y: customView.frame.height))
 path.addLine(to: CGPoint(x: 0, y: customView.frame.height))
 */
