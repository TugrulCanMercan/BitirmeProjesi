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
        let examEntity = ExamEntity()

        var setquest = Set<QuestionEntity>()
        
        Item.questions?.forEach({ result in
            let questionEntity = QuestionEntity()
          
            
            questionEntity.category = result.category
            questionEntity.quesitons = result.quesitons
            questionEntity.questionAnswer = result.questionAnswer
            questionEntity.questionContent = result.questionContent
            questionEntity.selectedPicker = result.selectedPicker
            setquest.insert(questionEntity)
            
        })
        examEntity.questions = setquest
        
        
        
        examEntity.id = Item.id
        
        examEntity.examName = Item.examName
        
        let result = cdExamRepositoryProtocol.createExam(Item: examEntity)
        return result
    }
    
    func getAllExamList() -> [ExamModel]? {
        let list = cdExamRepositoryProtocol.getAllExam()
        let examList = list?.map({ item in
            return item.toDomainModel()
        })
        return examList
    }
}
