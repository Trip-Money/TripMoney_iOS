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

    // MARK: - private method

    private func animateView(isCollapse: Bool,
                             buttonText: String,
                             heighConstraint: Double) {

        UIView.animate(withDuration: 0.5) {
            self.shouldCollapse = isCollapse
            self.mainHeightConstraint.constant = CGFloat(heighConstraint)
            self.cellExpandButton.setTitle(self.buttonTitle, for: .normal)
            self.layoutIfNeeded()
            self.superViewCompletion?() //?
        }
    }

    // MARK: - selectors

    @objc
    func didButtonTap() {
        if shouldCollapse {
            animateView(isCollapse: false,
                        buttonText: buttonTitle,
                        heighConstraint: 0)
        } else {
            animateView(isCollapse: true,
                        buttonText: buttonTitle,
                        heighConstraint: 100)
        }
    }
}

extension ExpandableView {

    //        contentView.addSubviews(titleView, cellExpandButton, cellNameLabel, dropdownView)
    //        contentView.frame = bounds
    //        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin]
    //        addSubview(contentView)

    func setupLayout() {
        contentView.addSubviews(titleView, cellExpandButton, cellNameLabel, dropdownView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin]
        addSubview(contentView)

        titleView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        cellExpandButton.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
        cellNameLabel.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview().inset(24.0)
        }
        dropdownView.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
    }
}
