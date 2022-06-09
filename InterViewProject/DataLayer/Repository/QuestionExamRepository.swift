//
//  QuestionExamRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.04.2022.
//

import Foundation
import Infrastructure

final class QuestionExamRepository{
    let networkService:DataTransferService
    
    init(networkService:DataTransferService){
        self.networkService = networkService
    }
}


extension QuestionExamRepository:QuestionExamRepositoryProtocol{
    func postResultExamTurnIn(exam: ExamModel, completionHandler: @escaping (Result<BaseEntity<ResponseMessage>, Error>) -> Void) {
        let exnpoint = APIEndpoints.Exam
    }
    
    func getAllQuestionList(questionId: [String], completionHandler: @escaping (Result<BaseEntity<[TTQuestion]>, Error>) -> Void) {
        let endpoint = APIEndpoints.Question.getAllQuestionId(questionsId: questionId)
        networkService.request(with: endpoint) { result in
            switch result {
            case .success(let question):
                
                completionHandler(.success(BaseEntity<[TTQuestion]>(responseMessage: "başarılı", data: question.toDomain(), responseStatus: "200")))
            case .failure(let err):
                completionHandler(.failure(err))
            }
        }
    }
    
 
    
    func getExamId(examId: String, completionHandler: @escaping (Result<BaseEntity<ExamModel>,Error>) -> Void) {
        let endpoint = APIEndpoints.Exam.getExamId(examId: GetExamByIdRequestDTO(examId: examId))
        networkService.request(with: endpoint) { result in
            switch result {
            case .success(let data):
                guard let exam = data.first else { return }
                completionHandler(.success(BaseEntity<ExamModel>(responseMessage: "başarılı", data: exam.toDomain() , responseStatus: "")))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func addQuestion(question: TTQuestion, completionHandler: @escaping (Result<TTQuestion, Error>) -> Void) {
        print("boş")
    }

    func addExam(exam: ExamModel, completionHandler: @escaping (Result<BaseEntity<ResponseMessage>, Error>) -> Void) {
//        Exam questionsdto daki alan aslında id listesi
        let endpoint = APIEndpoints.Exam.addExam(exam: ExamRequestDTO(UUID: exam.id,
                                                                      examTitle: exam.examName,
                                                                      examCategory:nil ,
                                                                      examStartTime: exam.examStartDate,
                                                                      examEndTime: exam.examEndDate,
                                                                      examQuestions: exam.questions?.compactMap({$0.UUID?.uuidString}),
                                                                      examTotalPoint: nil))
        networkService.request(with: endpoint) { result in
            switch result {
                
            case .success(let response):
                completionHandler(.success(BaseEntity<ResponseMessage>.init(responseMessage: "başarılı", data: response.toDomain(), responseStatus: "200")))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func getCategoryList(categoryList: [String], completionHandler: @escaping (Result<TTQuestion, Error>) -> Void) {
        
    }
    
    
    
    
}
