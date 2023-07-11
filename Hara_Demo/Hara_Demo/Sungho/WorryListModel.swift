//
//  WorryListModel.swift
//  MVVM-HARA
//
//  Created by saint on 2023/03/31.
//

import UIKit

// 서버통신용 model(codable)
struct WorryListModel{
    let templateId: Int
    let templateTitle: String
    let title: String
    let period: String
}

// View에 뿌려주기 위한 model
struct WorryListPublisherModel{
    let templateId: Int
    let templateTitle: String
    let title: String
    let period: String
    let image: UIImage
}
