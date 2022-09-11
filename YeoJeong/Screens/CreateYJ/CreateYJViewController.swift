//
//  CreateYJViewController.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/11.
//

import UIKit

import SnapKit

class CreateYJViewController: BaseViewController {

    // MARK: - view

    private let stackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 5.0
        let first = ExpandableView()
        let second = ExpandableView()

        $0.addArrangedSubviews(first, second)

        return $0
    }(UIStackView())

    private let tripLocationView: UIView = {

        return $0
    }(UIView())

    private let tripDateView: UIView = {

        return $0
    }(UIView())

    private let tripNameView: UIView = {

        return $0
    }(UIView())

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func setupLayout() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
