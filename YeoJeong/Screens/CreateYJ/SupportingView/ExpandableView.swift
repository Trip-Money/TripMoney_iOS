//
//  ExpandableView.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/12.
//

import UIKit

import SnapKit

class ExpandableView: UIView {

    // MARK: - view

    private let contentView = UIView()

    private let titleView: UIView = {
        $0.backgroundColor = .green
        return $0
    }(UIView())

    private let cellExpandButton: UIButton = {
        $0.addTarget(nil, action: #selector(didButtonTap), for: .touchUpInside)
        return $0
    }(UIButton())

    private let cellNameLabel: UILabel = {
        $0.text = "여행지 설정"
        $0.font = .systemFont(ofSize: 22.0, weight: .bold)
        return $0
    }(UILabel())

    private let dropdownView: UIImageView = {
        $0.contentMode = .scaleToFill
        $0.backgroundColor = .red
        return $0
    }(UIImageView())

    // MARK: - property

    private var shouldCollapse = false
    private var mainHeightConstraint = NSLayoutConstraint() //?
    var superViewCompletion: (() -> Void)? //?
    var buttonTitle: String {
        return shouldCollapse ? "Show Less" : "Show More"
    }

    // MARK: - init

    override init(frame: CGRect) {
       super.init(frame: frame)
        setupLayout()
   }

   required init?(coder: NSCoder) {
       super.init(coder: coder)
   }
}
