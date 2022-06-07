//
//  QuestionAndExamUseCase.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.04.2022.
//

import Foundation


protocol IQuestionAndExamUseCase {
    func addExam(exam:ExamModel, completionHandler: @escaping (Result<BaseEntity<ResponseMessage>,Error>) -> Void) 
}

final class QuestionAndExamUseCase{
    
    let questionExamRepository:QuestionExamRepositoryProtocol
    
    init(questionExamRepository:QuestionExamRepositoryProtocol) {
        self.questionExamRepository = questionExamRepository
    }
    
}

extension QuestionAndExamUseCase: IQuestionAndExamUseCase {
    func addExam(exam: ExamModel, completionHandler: @escaping (Result<BaseEntity<ResponseMessage>, Error>) -> Void) {
        questionExamRepository.addExam(exam: exam, completionHandler: completionHandler)
    }
}
