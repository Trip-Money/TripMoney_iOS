//
//  CreateYJViewController.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/11.
//

import UIKit

class CreateYJViewController: BaseViewController {

    // MARK: - view

    private let stackView: UIStackView = {

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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
}
