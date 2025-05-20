//
//  QuestionModel.swift
//  MVVM
//
//  Created by Mddaniyal on 3/19/25.
//

import Foundation

//struct DataModel: Codable {
//    
//    var data: QuestionsModel?
//}
//
struct QuestionsModel: Codable {
    
    var questions: [Questions]?
}

struct Questions: Codable {

    var question: String
}



