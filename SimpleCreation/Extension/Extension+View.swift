//
//  Extension+View.swift
//  SimpleCreation
//
//  Created by Erum on 21/12/21.
//

import UIKit



extension UIView {
    class func viewFromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    class func loadNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}
