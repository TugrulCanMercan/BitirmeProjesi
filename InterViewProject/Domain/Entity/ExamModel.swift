//
//  ExamModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import Foundation


struct ExamModel:Identifiable {
    let id:UUID?
    let examName:String?
    let questions:[TTQuestion]?
    
}


extension ExamModel {
    func toDomainModel() -> ExamModel {
        return .init(id: id, examName: examName, questions: questions)
    }
}
