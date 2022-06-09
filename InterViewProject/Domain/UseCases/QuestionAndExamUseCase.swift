//
//  QuestionAndExamUseCase.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.04.2022.
//

import Foundation


protocol IQuestionAndExamUseCase {
    func addExam(exam:ExamModel, completionHandler: @escaping (Result<BaseEntity<ResponseMessage>,Error>) -> Void)
    func getAllExam(examId:String,completionHandler: @escaping (Result<BaseEntity<ExamModel>,Error>) -> Void) // isminde hata var
    func getAllQuestionList(questionId:[String],completionHandler: @escaping (Result<BaseEntity<[TTQuestion]>,Error>) -> Void)
}

final class QuestionAndExamUseCase{
    
    let questionExamRepository:QuestionExamRepositoryProtocol
    
    init(questionExamRepository:QuestionExamRepositoryProtocol) {
        self.questionExamRepository = questionExamRepository
    }
    
}

extension QuestionAndExamUseCase: IQuestionAndExamUseCase {
    func getAllQuestionList(questionId: [String], completionHandler: @escaping (Result<BaseEntity<[TTQuestion]>, Error>) -> Void) {
        
    }
    
    
    func getAllExam(examId: String, completionHandler: @escaping (Result<BaseEntity<ExamModel>, Error>) -> Void) {

        questionExamRepository.getExamId(examId: examId) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let exam):
                if let examQuestionID = exam.data.questions?.compactMap({$0.UUID?.uuidString.lowercased()}) {
                    self.questionExamRepository.getAllQuestionList(questionId: examQuestionID) { result in
                        switch result {
                        case .success(let questionList):
                            let exam = ExamModel(id: exam.data.id, examName: exam.data.examName, questions: questionList.data, examStartDate: exam.data.examStartDate, examEndDate: exam.data.examEndDate)
                            completionHandler(.success(.init(responseMessage: "başarılı", data: exam, responseStatus: "200")))
                        case .failure(let err):
                            print("sınav soruları getirilemedi\(err)")
                        }
                    }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func addExam(exam: ExamModel, completionHandler: @escaping (Result<BaseEntity<ResponseMessage>, Error>) -> Void) {
        questionExamRepository.addExam(exam: exam, completionHandler: completionHandler)
    }
    
    
    func postResultExamTurnIn(exam: ExamModel , completionHandler: @escaping (Result<BaseEntity<ResponseMessage>, Error>) -> Void){
        
    }
    
}
