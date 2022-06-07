//
//  ExamModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import Foundation


struct ExamModel:Identifiable{
    let id:UUID?
    let examName:String?
    let questions:[TTQuestion]?
    let examStartDate:Date?
    let examEndDate:Date?
    
    init(id:UUID?,
         examName:String?,
         questions:[TTQuestion]?,
         examStartDate:Date? = nil,
         examEndDate:Date? = nil
    ){
        self.id = id
        self.examName = examName
        self.questions = questions
        self.examStartDate = examStartDate
        self.examEndDate = examEndDate
    }
    
}


extension ExamModel {
    func toDomainModel() -> ExamModel {
        return .init(id: id, examName: examName, questions: questions,examStartDate: examStartDate,examEndDate: examEndDate)
    }
}
