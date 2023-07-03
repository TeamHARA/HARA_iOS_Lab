//
//  TabBarController.swift
//  Hara_Demo
//
//  Created by 배성호 on 2022/11/17.
//

import UIKit
import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    let HEIGHT_TAB_BAR : CGFloat = 100
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTabBarItemStyle()
        setTabBarHeight()
        self.selectedIndex = 2
    }
    
    // TabBar높이 지정해주는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = HEIGHT_TAB_BAR
        tabFrame.origin.y = self.view.frame.size.height - HEIGHT_TAB_BAR
        self.tabBar.frame = tabFrame
    }
    
    // TabBarItem 생성해 주는 메서드
    private func makeTabVC(vc: UIViewController, tabBarTitle: String, tabBarImg: String, tabBarSelectedImg: String) -> UIViewController {
        
        vc.tabBarItem = UITabBarItem(title: tabBarTitle,
                                     image: UIImage(named: tabBarImg)?.withRenderingMode(.alwaysOriginal),
                                     selectedImage: UIImage(named: tabBarSelectedImg)?.withRenderingMode(.alwaysOriginal))
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        return vc
    }
    
    /// TabBar의 height을 설정하는 메서드
    private func setTabBarHeight() {
        let height = self.view.safeAreaInsets.bottom
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = height - 150 // 원하는 높이(기존 높이 + 50)
        tabFrame.origin.y = self.view.frame.size.height - height
        
        self.tabBar.frame = tabFrame
        self.tabBar.setNeedsLayout()
        self.tabBar.layoutIfNeeded()
    }
    
    /// TabBarItem을 지정하는 메서드
    private func setTabBar() {
        let homeTab = makeTabVC(vc: BaseNC(rootViewController: StyleVC()), tabBarTitle: "스타일", tabBarImg:"cloth", tabBarSelectedImg: "cloth_filled")
        homeTab.tabBarItem.tag = 0
        
        let categoryTab = makeTabVC(vc: BaseNC(rootViewController: AvatarVC()), tabBarTitle: "아바타", tabBarImg: "avatar", tabBarSelectedImg: "avatar_filled")
        categoryTab.tabBarItem.tag = 1
        
        let libraryTab = makeTabVC(vc: BaseNC(rootViewController: HomeVC()), tabBarTitle: "홈", tabBarImg: "home", tabBarSelectedImg: "home_filled")
        libraryTab.tabBarItem.tag = 2
        
        let notificationTab = makeTabVC(vc: BaseNC(rootViewController: MineVC()), tabBarTitle: "찜", tabBarImg: "heart", tabBarSelectedImg: "heart_filled")
        notificationTab.tabBarItem.tag = 3
        
        let myPageTab = makeTabVC(vc: BaseNC(rootViewController: CameraVC()), tabBarTitle: "측정", tabBarImg: "camera", tabBarSelectedImg: "camera_filled")
        myPageTab.tabBarItem.tag = 4
        
        let tabs = [homeTab, categoryTab, libraryTab, notificationTab, myPageTab]
        self.setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarItemStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
        
        // 기본적인 tabBar의 글자색을 지정해준다.
        self.tabBar.tintColor = .black
        
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()
        
        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBar.standardAppearance = tabBarAppearance
    }
    
}

extension CALayer {
    // Sketch 스타일의 그림자를 생성하는 유틸리티 함수
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}

extension UITabBar {
    // 기본 그림자 스타일을 초기화해야 커스텀 스타일을 적용할 수 있음
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}



