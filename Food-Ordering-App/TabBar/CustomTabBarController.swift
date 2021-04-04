//
//  CustomTabBarController.swift
//  Food-Ordering-App
//
//  Created by macbook on 04/04/2021.
//

import UIKit

class CustomTabBarController: UIViewController {

    @IBOutlet weak var tabBar: CustomTabBar!
    @IBOutlet weak var containerView: UIView!
    
    private lazy var MainHome: ViewController = {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.addChild(VC)
        return VC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(MainHome)

        // Add Child View as Subview
        containerView.addSubview(MainHome.view)

        // Configure Child View
        MainHome.view.frame = containerView.bounds
        MainHome.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        MainHome.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    private func setupUI(){
        tabBar.transform = CGAffineTransform(translationX: 0, y: tabBar.frame.height)
    }
    
    private func animateTabBar(){
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: []) {
            self.tabBar.transform = .identity
        } completion: { (_) in
            
        }

    }
}
