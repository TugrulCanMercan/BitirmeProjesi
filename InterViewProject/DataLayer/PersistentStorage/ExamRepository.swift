////
////  ExamRepository.swift
////  InterViewProject
////
////  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 24.05.2022.
////
//
//import Foundation
//import CoreData
//
//class ExamRepository {
//    
//    let context:NSManagedObjectContext
//    
//    init (context:NSManagedObjectContext) {
//        self.context = context
//    }
//    
//    
//    
//    
//    func addExam () {
//        let examEntity = ExamEntity(context: context)
//        let questionEntity = QuestionEntity(context: context)
//        
//        var questionSet = Set<QuestionEntity>()
//        questionEntity.selectedPicker = "tugrul "
//        questionEntity.quesitons = ["naberla":"tugrul"]
//        questionEntity.questionAnswer = "tolga"
//        questionEntity.questionContent = "selam"
//        questionEntity.category = ["başş"]
//        examEntity.examName = "tugrul"
//        questionSet.insert(questionEntity)
//        examEntity.questions = questionSet
//        
//        do {
//            try context.save()
//        } catch let err {
//            print(err)
//        }
//    }
//    
//    
//    func getExam () {
//        
//        let request = NSFetchRequest<ExamEntity>(entityName: "ExamEntity")
//        var examList:[ExamEntity] = []
//        do {
//            examList = try context.fetch(request)
//        } catch let error {
//            print(error)
//        }
//        
//        examList.forEach { entity in
//            let res = entity.questions
//            res?.forEach({ entit in
//                print(entit)
//            })
//        }
//        
//    }
//}
