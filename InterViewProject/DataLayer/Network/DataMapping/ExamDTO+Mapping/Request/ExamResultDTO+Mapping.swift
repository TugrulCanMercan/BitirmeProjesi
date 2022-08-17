//
//  ExamResultDTO+Mapping.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.06.2022.
//

import Foundation


struct ExamResultDTO:Codable{
    let examId:UUID?
    let examTitle:String?
    var examQuestions:[ExamQuestionResultDTO]?
    let examStartDate:Date?
    let examEndDate:Date?
}


struct ExamQuestionResultDTO:Codable{
    let question:QuestionResultDTO
}
struct QuestionResultDTO:Codable{
    let questionContent:String
    let questionOptions:[String:String]
    let questionAnswer:String
}

