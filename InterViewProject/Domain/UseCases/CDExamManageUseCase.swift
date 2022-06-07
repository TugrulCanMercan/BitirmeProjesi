//
//  CDExamManageUseCase.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 30.05.2022.
//

import Foundation


final class CDExamManageUseCase {
    private let cdExamRepositoryProtocol:CDExamRepositoryProtocol
    
    init(cdExamRepositoryProtocol:CDExamRepositoryProtocol) {
        self.cdExamRepositoryProtocol = cdExamRepositoryProtocol
    }
    
    
    func createExam(Item :ExamModel) -> String? {

        let result = cdExamRepositoryProtocol.createExam(Item: Item)
        return result
    }
    
    func getAllExamList() -> [ExamModel]? {
        let list = cdExamRepositoryProtocol.getAllExam()
        let examList = list?.map({ item in
            return item.toDomainModel()
        })
            
        return examList
    }
    func getExam(identifier id: UUID) -> ExamModel? {
        let exam = cdExamRepositoryProtocol.getExamById(identifier: id)
        
        return exam?.toDomainModel()
        
    }
}
