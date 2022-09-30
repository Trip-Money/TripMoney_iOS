//
//  YJListCell.swift
//  YeoJeong
//
//  Created by Yu ahyeon on 2022/09/30.
//

import UIKit
import SnapKit

class YJListCell: UICollectionViewCell {
    
    static let identifier = "YJListCell"
    
    // MARK: - Property
    lazy var yjTitle: UILabel = {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 26)
        return $0
    }(UILabel())
    
    lazy var yjDate: UILabel = {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        return $0
    }(UILabel())
    
    // MARK: - Init (미친 초기화 처음에 해줘야하넴)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    private func setupCell() {
        layer.cornerRadius = 10.0
        layer.masksToBounds = false
        
        self.addSubview(yjTitle)
        self.addSubview(yjDate)
        
        yjTitle.snp.makeConstraints {
            $0.leading.top.equalTo(15)
        }
        yjDate.snp.makeConstraints {
            $0.top.equalTo(self.yjTitle.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(self.yjTitle)
        }
    }
}
