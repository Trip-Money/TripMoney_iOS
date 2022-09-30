//
//  MainView.swift
//  YeoJeong
//
//  Created by Yu ahyeon on 2022/09/30.
//

import UIKit
import SnapKit

class MainView: BaseViewController {
    
    // MARK: - property
    lazy var collectionView: UICollectionView = {
        $0.backgroundColor = .systemGray
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))

    lazy var segmentControl: UISegmentedControl = {
//        let segmentItems = ["현재 여정", "지난 여정"]
//        $0.frame = CGRect(x: 10, y: 250, width: (self.view.frame.width - 20), height: 50)
        $0.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        $0.selectedSegmentIndex = 0
        return $0
    }(UISegmentedControl(items: ["현재 여정", "지난 여정"]))

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

    override func setupAttributes() {
        super.setupAttributes()
        setupCollectionView()
    }

    override func setupLayout() {
        super.setupLayout()
        view.addSubview(segmentControl)
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.left.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.right.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.segmentControl.snp.bottom).offset(20)
            $0.left.equalTo(view.safeAreaLayoutGuide)
            $0.right.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view)
        }

    }
    
    private func setupCollectionView() {
        collectionView.register(YJListCell.self, forCellWithReuseIdentifier: YJListCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
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

    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
           //코드입력
          break
          case 1:
           //코드입력
          break
          default:
          break
       }
    }
}

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempYJData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YJListCell.identifier, for: indexPath) as! YJListCell
        cell.yjTitle.text = tempYJData[indexPath.row].title
        cell.yjDate.text = tempYJData[indexPath.row].date
        cell.backgroundView = UIImageView(image: UIImage(named: tempYJData[indexPath.row].image))
        cell.clipsToBounds = true
        return cell
    }
}

extension MainView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}
//

extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width - 32, height: 170)
        let width = collectionView.frame.width - 30
//        let height = 150
        return CGSize(width: width, height: 150)
        
    }
}

