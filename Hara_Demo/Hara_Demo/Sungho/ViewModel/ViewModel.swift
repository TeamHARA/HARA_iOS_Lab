//
//  ViewModel.swift
//  MVVM-HARA
//
//  Created by saint on 2023/03/31.
//

import UIKit
import Combine

// 뷰 모델로써 데이터의 상태를 가지고 있음
class ViewModel: ObservableObject{
    
    @Published var worryList: [WorryListModel] = [
        WorryListModel(templateId: 1, templateTitle: "할 일", image: UIImage(named: "gem_pink_m")!, title: "해라 릴리즈", Date: "23.02.01~23.02.02"),
        WorryListModel(templateId: 2, templateTitle: "학업", image: UIImage(named: "gem_orange_m")!, title: "이번 학기 학점", Date: "23.02.02~23.02.04"),
        WorryListModel(templateId: 3, templateTitle: "일상", image: UIImage(named: "gem_blue_m")!, title: "집에 갈까 말까", Date: "23.02.03~23.02.06"),
        WorryListModel(templateId: 2, templateTitle: "학업", image: UIImage(named: "gem_orange_m")!, title: "수업 드랍할까 말까?", Date: "23.02.04~23.02.08"),
        WorryListModel(templateId: 4, templateTitle: "진로", image: UIImage(named: "gemstone_green_m")!, title: "머 해먹고 살지,,?", Date: "23.02.05~23.04.10"),
        WorryListModel(templateId: 3, templateTitle: "일상", image: UIImage(named: "gem_blue_m")!, title: "저녁 뭐먹을까?", Date: "23.03.03~23.04.06"),
        WorryListModel(templateId: 1, templateTitle: "할 일", image: UIImage(named: "gem_pink_m")!, title: "컴시이실 공부하기", Date: "23.03.31~23.04.20"),
        WorryListModel(templateId: 1, templateTitle: "할 일", image: UIImage(named: "gem_pink_m")!, title: "컴시이실 공부하기", Date: "23.04.02~23.04.30"),
        WorryListModel(templateId: 5, templateTitle: "단 하나의 목표", image: UIImage(named: "gem_yellow_m")!, title: "캐라 릴리즈", Date: "23.06.30-~23.07.20"),
        WorryListModel(templateId: 6, templateTitle: "땡스투 새겨보기", image: UIImage(named: "gem_red_m")!, title: "회사 인턴", Date: "23.07.17-~23.07.30")
    ]
    
    @Published var templateList: [TemplateListModel] = [
        TemplateListModel(templateId: 0, templateImage: UIImage(named: "gem_pink_s_off")!, templateTitle: "모든 보석 보기", templateDetail: "그동안 캐낸 모든 보석을 볼 수 있어요"),
        TemplateListModel(templateId: 1, templateImage: UIImage(named: "gem_pink_s_off")!, templateTitle: "Free Flow", templateDetail: "빈 공간을 자유롭게 채우기"),
        TemplateListModel(templateId: 2, templateImage: UIImage(named: "gem_orange_s_off")!, templateTitle: "장단점 생각하기", templateDetail: "할까? 말까? 최고의 선택을 돕는 해결사"),
        TemplateListModel(templateId: 3, templateImage: UIImage(named: "gem_blue__off")!, templateTitle: "다섯번의 왜?", templateDetail: "5why 기법을 활용한 물음표 곱씹기"),
        TemplateListModel(templateId: 4, templateImage: UIImage(named: "gemstone_green_s_off")!, templateTitle: "자기관리론", templateDetail: "데일카네기가 제시한 걱정 극복 글쓰기"),
        TemplateListModel(templateId: 5, templateImage: UIImage(named: "gem_yellow_s_off")!, templateTitle: "단 하나의 목표", templateDetail: "One thing, 우선순위 정하기"),
        TemplateListModel(templateId: 6, templateImage: UIImage(named: "gem_red_s_off")!, templateTitle: "땡스투 새겨보기", templateDetail: "긍정적인 힘을 만드는 감사 일기"),
        TemplateListModel(templateId: 7, templateImage: UIImage(named: "gem_yellow_s_off")!, templateTitle: "10-10-10", templateDetail: "수지 웰치의 좋은 결정을 내리는 간단한 방법"),
        TemplateListModel(templateId: 8, templateImage: UIImage(named: "gem_red_s_off")!, templateTitle: "실행력 키우기", templateDetail: "move! move! 일단 움직여, 실행론")
    ]
    
    init(){
        print("ViewModel - init()")
    }
}
