//
//  UIView+.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/11.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
