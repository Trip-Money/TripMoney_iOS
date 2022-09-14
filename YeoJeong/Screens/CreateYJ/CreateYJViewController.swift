//
//  CreateYJViewController.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/11.
//

import UIKit

import SnapKit

final class CreateYJViewController: BaseViewController {

    // MARK: - View

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExpandableCell.self, forCellWithReuseIdentifier: "expandableCell")
        collectionView.register(ExpandableCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TodayCollectionReusableView")

        return collectionView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
