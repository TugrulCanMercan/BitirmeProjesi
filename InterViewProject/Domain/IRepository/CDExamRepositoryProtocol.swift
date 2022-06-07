//
//  CDExamRepositoryProtocol.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 30.05.2022.
//

import Foundation


protocol CDExamRepositoryProtocol{
    
    
    func getExamById(identifier id : UUID) -> ExamEntity?
    
    func getAllExam() -> [ExamEntity]?
    
    func updateExam(identifier id : UUID) -> ExamEntity?
    
    func createExam(Item: ExamModel) -> String?
    
}
