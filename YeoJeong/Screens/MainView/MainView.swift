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

}
