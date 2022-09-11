//
//  BaseViewController.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/10.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - property

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupAttributes()
        setupLayout()
    }

    // MARK: - func

    func setupNavigationBar() {
        // Create NavigationBar
    }

    func setupAttributes() {
        // Override Attributes
    }

    func setupLayout() {
        // Override Layout
    }
}
