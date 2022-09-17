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
        return collectionView
    }()

    // MARK: - properties

    private let expandableCell = ExpandableCell()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: - base에 올려놓을 것임 노엘이 - 삭제하고 올리셈
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - delegate

extension CreateYJViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "expandableCell", for: indexPath) as? ExpandableCell else {
            fatalError()
        }

//        collectionViewCell.title.text = shop.title
//        collectionViewCell.description.text = shop.title

//        if isExpanded[indexPath.item] {
//            collectionViewCell.innerView.isHidden = false
//        } else {
//            collectionViewCell.innerView.isHidden = true
//        }

        return collectionViewCell
    }
}

extension CreateYJViewController: UICollectionViewDelegateFlowLayout {

    // MARK: Dynamic height calculation

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false

        expandableCell.frame = CGRect(
            origin: .zero,
            size: CGSize(width: collectionView.bounds.width - 40, height: 1000)
        )
        expandableCell.isSelected = isSelected
        expandableCell.setNeedsLayout()
        expandableCell.layoutIfNeeded()
//        expandableCell.sectionName.text = isSelected ? "T" : "F"
        let size = expandableCell.systemLayoutSizeFitting(
            CGSize(width: collectionView.bounds.width - 40, height: .greatestFiniteMagnitude),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
        return size
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        16 // cell 별 간격
    }

}

extension CreateYJViewController: UICollectionViewDelegate {

    // MARK: - Override method to animate cell collapse

    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.performBatchUpdates(nil)
        return true
    }

    // MARK: - Override the method to animate the unwrapping of the cell

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        collectionView.performBatchUpdates(nil)

        // MARK: - And scroll so that when the cell is expanded, it is completely visible

        DispatchQueue.main.async {
            guard let attributes = collectionView.collectionViewLayout.layoutAttributesForItem(at: indexPath) else {
                return
            }
            let desiredOffset = attributes.frame.origin.y - 20
            let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
            let maxPossibleOffset = contentHeight - collectionView.bounds.height
            let finalOffset = max(min(desiredOffset, maxPossibleOffset), 0)
            collectionView.setContentOffset(
                CGPoint(x: 0, y: finalOffset),
                animated: true
            )
        }
        return true
    }
}
