//
//  ExpandableCell.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/12.
//

import UIKit

import SnapKit

class ExpandableCell: UICollectionViewCell {

    // MARK: - view

    private var expandedConstraint: Constraint!
    private var collapsedConstraint: Constraint!

    private let mainContainer = UIView()
    private let topContainer = UIView()
    private let bottomContainer = UIView()
}
