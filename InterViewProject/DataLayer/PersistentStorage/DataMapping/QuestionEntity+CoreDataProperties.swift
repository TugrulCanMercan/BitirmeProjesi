//
//  QuestionEntity+CoreDataProperties.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//
//

import Foundation
import CoreData


extension QuestionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionEntity> {
        return NSFetchRequest<QuestionEntity>(entityName: "QuestionEntity")
    }

    @NSManaged public var category: [String]?
    @NSManaged public var quesitons: [String:String]?
    @NSManaged public var questionAnswer: String?
    @NSManaged public var questionContent: String?
    @NSManaged public var selectedPicker: String?
    @NSManaged public var exam: NSSet?

}

// MARK: Generated accessors for exam
extension QuestionEntity {

    @objc(addExamObject:)
    @NSManaged public func addToExam(_ value: ExamEntity)

    @objc(removeExamObject:)
    @NSManaged public func removeFromExam(_ value: ExamEntity)

    @objc(addExam:)
    @NSManaged public func addToExam(_ values: NSSet)

    @objc(removeExam:)
    @NSManaged public func removeFromExam(_ values: NSSet)

}
