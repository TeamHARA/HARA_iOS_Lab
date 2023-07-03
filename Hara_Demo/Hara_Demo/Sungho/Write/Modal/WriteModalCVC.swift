//
//  WriteModalCVC.swift
//  Hara_Demo
//
//  Created by saint on 2023/07/04.
//

import UIKit
import SnapKit
import Then

class WriteModalCVC: UICollectionViewCell {
    
    let templateCell = UIView().then{
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    private let templateImage = UIImageView().then{
        $0.image = UIImage(named: "jewel")
        $0.backgroundColor = .clear
    }
    
    private let templateTitle = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .white
    }
    
    private let templateDetail = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = 0x93A0AC.color
    }
    
    let checkIcon = UIImageView().then{
        $0.image = UIImage(named: "icn_check")
        $0.backgroundColor = .clear
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WriteModalCVC{
    
    // MARK: - Layout
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(templateCell)
        
        templateCell.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        templateCell.addSubviews([templateImage, templateTitle, templateDetail, checkIcon])
        
        templateImage.snp.makeConstraints{
            $0.width.height.equalTo(46.adjustedW)
            $0.leading.equalToSuperview().offset(10.adjustedW)
            $0.centerY.equalToSuperview()
        }
        
        templateTitle.snp.makeConstraints{
            $0.leading.equalTo(templateImage.snp.trailing).offset(8.adjustedW)
            $0.top.equalToSuperview().offset(19.adjustedW)
        }
        
        templateDetail.snp.makeConstraints{
            $0.leading.equalTo(templateTitle.snp.leading)
            $0.top.equalTo(templateTitle.snp.bottom).offset(4.adjustedW)
        }
        
        checkIcon.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20.adjustedW)
            $0.width.height.equalTo(26.adjustedW)
        }
    }
    
    func dataBind(model: TemplateListModel, indexPath: IndexPath) {
        templateImage.image = model.templateImage
        templateTitle.text = model.templateTitle
        templateDetail.text = model.templateDetail
    }
}