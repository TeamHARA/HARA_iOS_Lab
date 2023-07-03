//
//  addVC.swift
//  Hara_Demo
//
//  Created by saint on 2023/07/03.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

class WriteVC: UIViewController {
    
    private let closeBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "icn_back"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let completeBtn = UIButton().then {
        $0.backgroundColor = 0x444C55.color // gray_3
        $0.titleLabel?.font = .systemFont(ofSize: 14.adjustedW, weight: .medium)
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 12
    }
    
    private let templateBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    private let templateTitle = UILabel().then {
        $0.text = "템플릿을 선택해주세요"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16.adjustedW, weight: .medium)
    }
    
    private let dropdownBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "icn_drop_down"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let underLine = UIView().then {
        $0.backgroundColor = 0x444444.color
    }
    
    private let worryTitleLabel = UILabel().then {
        $0.text = "고민에 이름을 붙여주세요"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16.adjustedW, weight: .medium)
    }
    
    private let worryTitleTextField = UITextField().then{
        $0.layer.cornerRadius = 8
        $0.backgroundColor = 0x444C55.color
        $0.textColor = 0x9BA1AA.color
        $0.font = .systemFont(ofSize: 12.adjustedW, weight: .medium)
        $0.addLeftPadding()
        
        // Placeholder 색상 설정
        let placeholderText = "이 고민에 이름을 붙이자면..."
        let placeholderColor = 0x9BA1AA.color
        $0.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    private let worryContentLabel = UILabel().then {
        $0.text = "고민 내용 작성하기"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16.adjustedW, weight: .medium)
    }
    
    private let baseImage = UIImageView().then {
        $0.image = UIImage(named: "no_template")
        $0.contentMode = .scaleToFill
        $0.backgroundColor = .clear
    }
    
    private let introTitle = UILabel().then {
        $0.text = "선택된 템플릿이 없어요!"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18.adjustedW, weight: .semibold)
    }
    
    private let introDetail = UILabel().then {
        $0.text = "상단에서 템플릿을 골라볼까요?"
        $0.textColor = 0x9BA1AA.color
        $0.font = .systemFont(ofSize: 12.adjustedW, weight: .light)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        pressBtn()
    }
    
    // MARK: - Functions
    private func pressBtn(){
        closeBtn.press { [self] in
            self.dismiss(animated: true)
        }
    }
}

// MARK: - Layout
extension WriteVC{
    private func setLayout(){
        view.backgroundColor = 0x1E2227.color
        view.addSubviews([closeBtn, completeBtn, templateBtn, templateTitle])
        templateBtn.addSubviews([templateTitle, dropdownBtn, underLine])
        view.addSubviews([worryTitleLabel, worryTitleTextField, worryContentLabel])
        view.addSubviews([baseImage, introTitle, introDetail])
        
        closeBtn.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20.adjustedW)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.adjustedW)
            $0.height.width.equalTo(24.adjustedW)
        }
        
        completeBtn.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20.adjustedW)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-16.adjustedW)
            $0.width.equalTo(50.adjustedW)
            $0.height.equalTo(26.adjustedW)
        }
        
        templateBtn.snp.makeConstraints{
            $0.top.equalTo(completeBtn.snp.bottom).offset(16)
            $0.height.equalTo(60.adjustedW)
            $0.leading.trailing.equalToSuperview()
        }
        
        templateTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(12.adjustedW)
            $0.centerY.equalToSuperview()
        }
        
        dropdownBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16.adjustedW)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(24.adjustedW)
        }
        
        underLine.snp.makeConstraints{
            $0.bottom.equalTo(templateBtn.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        worryTitleLabel.snp.makeConstraints{
            $0.top.equalTo(underLine.snp.bottom).offset(20.adjustedW)
            $0.leading.equalToSuperview().offset(12.adjustedW)
        }
        
        worryTitleTextField.snp.makeConstraints{
            $0.top.equalTo(worryTitleLabel.snp.bottom).offset(12.adjustedW)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.height.equalTo(44.adjustedW)
        }
        
        worryContentLabel.snp.makeConstraints{
            $0.top.equalTo(worryTitleTextField.snp.bottom).offset(26.adjustedW)
            $0.leading.equalToSuperview().offset(12.adjustedW)
        }
        
        baseImage.snp.makeConstraints{
            $0.top.equalTo(worryContentLabel.snp.bottom).offset(120.adjustedW)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120.adjustedW)
            $0.height.equalTo(95.adjustedW)
        }
        
        introTitle.snp.makeConstraints{
            $0.top.equalTo(baseImage.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        introDetail.snp.makeConstraints{
            $0.top.equalTo(introTitle.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
