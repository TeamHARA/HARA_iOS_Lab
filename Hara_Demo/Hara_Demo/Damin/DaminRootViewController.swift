//
//  DaminRootViewController.swift
//  Hara_Demo
//
//  Created by 김담인 on 2023/04/02.
//

import UIKit
import Then

// safeAreaInset 값을 가져오기 위한 익스텐션
extension UIApplication {
    static var safeAreaInset: UIEdgeInsets  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}

class DaminRootViewController: UIViewController {
    // MARK: - Properties
    var views: [HomeView] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.118, green: 0.133, blue: 0.153, alpha: 1)
        setViews()
    }
    
    // MARK: - Function
    func setViews() {
        for _ in 0...9 {
            // 뷰의 safeAreaInset을 넘겨주고 HomeView의 인스턴스 생성
            let view = HomeView(UIApplication.safeAreaInset)
            self.view.addSubview(view)
            views.append(view)
        }
        addAnimation(views: views)
        
    }
    
    func addAnimation(views : [HomeView]) {
        /// 레이어를 새로 만들어서 커스텀 하여 추가 할 수도 있음
//        let floatingLayer = CALayer()
//        floatingLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        floatingLayer.cornerRadius = 10
//        floatingLayer.shadowOpacity = 0.5
//        floatingLayer.shadowRadius = 5
//        floatingLayer.shadowOffset = CGSize(width: 0, height: 5)
//        floatingLayer.backgroundColor = UIColor.gray.cgColor
      
        
        var bounceAnimations: [CABasicAnimation] = []
        for i in 0..<views.count {
            let bounceAnimation = CABasicAnimation(keyPath: "position.y")
            bounceAnimation.fromValue = views[i].layer.position.y
            bounceAnimation.toValue = views[i].layer.position.y - 10
            bounceAnimation.duration = 1
            bounceAnimation.autoreverses = true
            bounceAnimation.repeatCount = .infinity
            
            bounceAnimations.append(bounceAnimation)
            views[i].layer.add(bounceAnimations.last ?? CABasicAnimation(), forKey: "bounce")
            views[i].layer.backgroundColor = UIColor.red.cgColor
            let image = UIImage(named: "home_stone")
            views[i].layer.contents = image?.cgImage
            views[i].sizeToFit()
            views[i].clipsToBounds = false

            let textLayer = CATextLayer()
            textLayer.string = "내 고민"
            textLayer.foregroundColor = UIColor.white.cgColor
            textLayer.fontSize = 14
            textLayer.frame = CGRect(x: 0, y: 30, width: 50, height: 20)
            views[i].layer.addSublayer(textLayer)
        }
    }

}
