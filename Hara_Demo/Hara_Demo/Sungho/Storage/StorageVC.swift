//
//  ViewController.swift
//  MVVM-HARA
//
//  Created by saint on 2023/03/31.
//

import UIKit
import SnapKit
import Then
import Combine

class StorageVC: UIViewController, RefreshListDelegate{
    
    // MARK: - Properties
    var worryVM: WorryViewModel = WorryViewModel()
    var modalVC = StorageModalVC()
    
    var worryList: [WorryListPublisherModel] = []
    var disposalbleBag = Set<AnyCancellable>()
    
    private let titleLabel = UILabel().then{
        $0.text = "보석고민함"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    private let templateBtn = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "templateBtn"), for: .normal)
        $0.contentMode = .scaleToFill
    }
    
    private let sortHeaderView = WorryListHeaderView()
    
    private let flowLayout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .vertical
    }
    
    lazy var worryListCV: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: - Constants
    final let worryListInset: UIEdgeInsets = UIEdgeInsets(top: 12, left: 16.adjustedW, bottom: 100, right: 16.adjustedW)
    final let interItemSpacing: CGFloat = 12.adjustedW
    final let lineSpacing: CGFloat = 12.adjustedW
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayout()
        self.setBindings()
        self.registerCV()
        self.pressBtn()
        print("printok?")
        
        // delegate 권한을 부여해줍니다.
        modalVC.refreshListDelegate = self
        
        /// modalVC가 dismiss되는 것을 notificationCenter를 통해 worryVC가 알 수 있게 해줍니다.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.didDismissDetailNotification(_:)),
            name: NSNotification.Name("DismissModalView"),
            object: nil
        )
    }
    
    // MARK: - Functions
    @objc func didDismissDetailNotification(_ notification: Notification) {
        DispatchQueue.main.async { [self] in
            
            /// modalVC가 dismiss될때 컬렉션뷰를 리로드해줍니다.
            print(worryVM.worryListDummy)
            worryListCV.reloadData()
            print("reload 성공!")
        }
    }
    
    func refreshList(templateTitle: String, list: [WorryListPublisherModel]) {
        worryVM.worryListPublisher.value = list
        sortHeaderView.sortBtn.setTitle(templateTitle, for: .normal)
        print("delegate")
    }
    
    private func registerCV() {
        worryListCV.register(StorageCVC.self,
                             forCellWithReuseIdentifier: StorageCVC.classIdentifier)
        worryListCV.register(WorryListHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WorryListHeaderView.classIdentifier)
    }
    
    func pressBtn(){
        sortHeaderView.sortBtn.press {
            self.modalVC.modalPresentationStyle = .pageSheet
            
            if let sheet = self.modalVC.sheetPresentationController {
                
                /// 지원할 크기 지정 .large() 혹은 .medium()
                sheet.detents = [.large()]
                
                /// 시트 상단에 그래버 표시 (기본 값은 false)
                sheet.prefersGrabberVisible = true
            }
            self.present(self.modalVC, animated: true)
        }
    }
}
// MARK: - 뷰모델 관련
extension StorageVC{
    /// 뷰모델의 데이터를 뷰컨의 리스트 데이터와 연동
    fileprivate func setBindings(){
        print("ViewController - setBindings()")
        self.worryVM.worryListPublisher.sink{ [weak self] (updatedList : [WorryListPublisherModel]) in
            print("ViewController - updatedList.count: \(updatedList.count)")
            self?.worryList = updatedList
            self?.sortHeaderView.numLabel.text = "총 \(self!.worryList.count)개"
        }.store(in: &disposalbleBag)
    }
}

// MARK: - Layout
extension StorageVC{
    private func setLayout(){
        view.backgroundColor = 0x1E2227.color
        view.addSubviews([titleLabel, templateBtn, sortHeaderView, worryListCV])
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(24.adjustedW)
            $0.centerX.equalToSuperview()
        }
        
        templateBtn.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(24.adjustedH)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-16.adjustedW)
        }
        
        sortHeaderView.snp.makeConstraints{
            $0.top.equalTo(templateBtn.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(75.adjustedW)
        }
        
        worryListCV.snp.makeConstraints{
            $0.top.equalTo(sortHeaderView.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UICollectionDelegate
extension StorageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165.adjustedW, height: 165.adjustedW)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return worryListInset
    }
}

// MARK: - UICollectionViewDataSource

extension StorageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return worryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StorageCVC.classIdentifier, for: indexPath)
                as? StorageCVC else { return UICollectionViewCell() }
        cell.dataBind(model: worryList[indexPath.item])
        return cell
    }
}
