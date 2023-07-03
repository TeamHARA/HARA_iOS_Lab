//
//  TemplateDetailModel.swift
//  Hara_Demo
//
//  Created by saint on 2023/07/04.
//

import Foundation

struct BalanceGame: Codable {
    let id: Int
    let firstChoice: String
    let secondChoice: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstChoice = "solution1"
        case secondChoice = "solution2"
    }
    
}

//struct Response: Codable {
//    let status: Int
//    let success: Bool
//    let message: String
//    let data: TemplateData
//}
//
//struct TemplateData: Codable {
//    let info: String
//    let title: String
//    let questions: [String]
//    let hints: [String]
//
//    private enum CodingKeys: String, CodingKey {
//        case info
//        case title
//        case questions
//        case hints
//    }
//}
