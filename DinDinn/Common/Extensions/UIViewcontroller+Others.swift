//
//  UIViewcontroller+Others.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import UIKit


extension UIViewController {
    func configureGradiantLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
    }
}

extension UIViewController {

    func configureNavigationbar(withTitle title: String, prefersLargeTitles: Bool = false, backgroundColor: UIColor = .white, tintColor: UIColor = .black) {
        navigationItem.title = title

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: tintColor] // use tintColor for title color
        appearance.titleTextAttributes = [.foregroundColor: tintColor] // use tintColor for title color
        appearance.backgroundColor = backgroundColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles // use large titles
        navigationController?.navigationBar.tintColor = tintColor // use tintColor for title color for navigation bar buttons
        navigationController?.navigationBar.isTranslucent = true // translucency
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark // white text in system bar
    }
    
    func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }

}



