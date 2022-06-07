//
//  QuestionExamRepositoryProtocol.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.04.2022.
//

import Foundation


protocol QuestionExamRepositoryProtocol{
    
    func addQuestion(question:TTQuestion,completionHandler: @escaping (Result<TTQuestion,Error>) -> Void)
        
    func addExam(exam:ExamModel,completionHandler: @escaping (Result<BaseEntity<ResponseMessage>,Error>) -> Void)
    
    func getCategoryList(categoryList:[String],completionHandler: @escaping (Result<TTQuestion,Error>) -> Void)
    
    
}
