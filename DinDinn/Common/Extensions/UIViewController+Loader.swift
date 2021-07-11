//
//  UIViewController+Loader.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import UIKit
import JGProgressHUD


extension UIViewController {
    func showLoader(withText text: String? = "") -> JGProgressHUD {
        view.endEditing(true)
        let loader = JGProgressHUD(style: .dark)
        loader.textLabel.text = text
        loader.show(in: view)
        return loader
    }

    func showAlert(title:String? = "", message: String? = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel))
        present(alert, animated: true, completion: nil)
    }
}
