//
//  CreateTravelView.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/11.
//

import UIKit

import SnapKit

class CreateTravelView: BaseViewController {

    // MARK: - View

    private lazy var collectionView: UICollectionView = {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ExpandableCell.self, forCellWithReuseIdentifier: "expandableCell")
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: - base에 올려놓을 것임 노엘이 - 삭제하고 올리셈
        view.backgroundColor = UIColor.systemBackground
    }
}

// MARK: - UICollectionView Delegate

extension CreateTravelView: UICollectionViewDelegateFlowLayout {

}

// MARK: - UICollectionView DataSource

extension CreateTravelView: UICollectionViewDataSource {

}
