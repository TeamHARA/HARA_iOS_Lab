//
//  WorryListHeaderView.swift
//  MVVM-HARA
//
//  Created by saint on 2023/03/31.
//

import UIKit
import SnapKit
import Then

// MARK: - ListHeaderView
class WorryListHeaderView: UICollectionReusableView {
    
    // MARK: - UI Components
    let numLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14.adjustedW, weight: .light)
    }
    
    let sortBtn = UIButton().then {
        $0.backgroundColor = 0x30363D.color
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setTitle("모든 보석 보기", for: .normal)
        $0.setTitleColor(0xFFE5A3.color, for: .normal)
    }
    
    private let toggleBtn = UIImageView().then {
        $0.image = UIImage(named: "toggle_down")
        $0.contentMode = .scaleToFill
        $0.backgroundColor = .clear
    }
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WorryListHeaderView{
    func setLayout(){
        self.backgroundColor = .clear
        self.addSubViews([sortBtn, numLabel, toggleBtn])
        
        sortBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(16.adjustedW)
            $0.trailing.equalToSuperview().offset(-16.adjustedW)
            $0.height.equalTo(32.adjustedW)
        }
        
        numLabel.snp.makeConstraints{
            $0.top.equalTo(sortBtn.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16.adjustedW)
        }
        
        toggleBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-36.adjustedW)
            $0.centerY.equalTo(sortBtn.snp.centerY)
            $0.width.equalTo(12.adjustedW)
            $0.height.equalTo(6.adjustedW)
        }
    }
}
