//
//  MainView.swift
//  YeoJeong
//
//  Created by Yu ahyeon on 2022/09/30.
//

import UIKit

class MainView: BaseViewController {
    
    // MARK: - property
    lazy var collectionView: UICollectionView = {
        $0.backgroundColor = .systemGray
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - func
    override func setupNavigationBar() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddButton(_:))),
            UIBarButtonItem(image: UIImage(systemName: "keyboard"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "bell"), style: .done, target: self, action: nil)
        ]
    }

    @objc private func tapAddButton(_ sender: Any) {
//        let addModel = AddNewCategory()
//        addModel.categoryNameDelegate = self
//        addModel.boardListViewModel = boardListViewModel
//        let nav = UINavigationController(rootViewController: addModel)
//        nav.modalPresentationStyle = .pageSheet
//        if let sheet = nav.sheetPresentationController {
//                    sheet.detents = [.medium()]
//                }
//                present(nav, animated: true, completion: nil)
    }
}
