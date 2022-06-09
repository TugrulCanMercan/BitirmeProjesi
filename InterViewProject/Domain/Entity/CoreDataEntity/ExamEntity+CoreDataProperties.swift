//
//  ExamEntity+CoreDataProperties.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//
//

import Foundation
import CoreData


extension ExamEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExamEntity> {
        return NSFetchRequest<ExamEntity>(entityName: "ExamEntity")
    }

    @NSManaged public var examName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var questions: Set<QuestionEntity>?

}

// MARK: Generated accessors for questions
extension ExamEntity {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: QuestionEntity)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: QuestionEntity)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}

extension ExamEntity : Identifiable {
    
    func toDomainModel() -> ExamModel {
        
        
        let questionList = questions?.compactMap({ item -> TTQuestion in
            
            let ttQuestionModel = TTQuestion(UUID: item.questionId,
                                             category: item.category ?? [],
                                             selectedPicker: item.selectedPicker ?? "",
                                             questionContent: item.questionContent ?? "",
                                             quesitons: item.quesitons ?? [:],
                                             questionAnswer: item.questionAnswer ?? "")
            return ttQuestionModel
        })
        let exam = ExamModel(id: id, examName: examName, questions: questionList)
        return exam
    }

//    func toDomainModel() -> ExamModel {
//
//        if let question = questions?.allObjects as? [QuestionEntity] {
//            let result = question.compactMap { entity -> TTQuestion in
//
//                return .init(category: entity.category ?? [], selectedPicker: entity.selectedPicker ?? "", questionContent: entity.questionContent ?? "", quesitons: entity.quesitons ?? [:], questionAnswer: entity.questionAnswer ?? "")
//            }
//            return .init(examName: examName, questions: result)
//        } else {
//            return .init(examName: nil, questions: nil)
//        }
//
//    }
    
//    var questions_ : Set<QuestionEntity> {
//        get { (questions as? Set<QuestionEntity>) ?? []}
//        set { questions = newValue as NSSet}
//    }
}
