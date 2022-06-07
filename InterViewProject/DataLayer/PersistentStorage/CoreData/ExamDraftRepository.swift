//
//  ExamDraftListRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 25.05.2022.
//

import Foundation
import CoreData




// class BaseRepository<T:NSManagedObject>:RepositoryProtocol {
//
//    let context : NSManagedObjectContext
//
//
//    init (context : NSManagedObjectContext) {
//        self.context = context
//    }
//
//    func create(item: T) {
//
//        let className = String(describing: T.self)
//        var managedObject = NSEntityDescription.insertNewObject(forEntityName: className, into: context) as? T
//        managedObject = item
//        do {
//            try managedObject?.managedObjectContext?.save()
//        } catch let err {
//            print("hata alındı \(err)")
//        }
//
//    }
//
//    func getAll() -> [T]? {
//        let fetchReq = Entity.fetchRequest()
//        fetchReq.predicate = nil
//        fetchReq.sortDescriptors = nil
//
//
//        do {
//           let result = try context.fetch(fetchReq) as? [T]
//            return result
//
//        } catch  {
//            return nil
//        }
//
//
//
//    }
//
//
//
//    typealias Entity = T
//
//}



protocol ExamDraftProtocol:RepositoryProtocol {
    
}


class ExamDraftRepo: CDExamRepositoryProtocol,ExamDraftProtocol{

    var context: NSManagedObjectContext
    
    typealias Entity = ExamEntity
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    
    func getExamById(identifier id: UUID) -> ExamEntity? {
        do {
            let result = try get(byIdentifier: id)
            return result
        } catch let err {
            print(err)
            
            return nil
        }
    }
    
    func updateExam(identifier id: UUID) -> ExamEntity? {
        return nil
    }
    
    func createExam(Item: ExamModel) -> String? {
        let examEntity = ExamEntity(context: context)

        var setquest = Set<QuestionEntity>()
        
        Item.questions?.forEach({ result in
            let questionEntity = QuestionEntity(context: context)
          
            
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
        return create(item: examEntity)
    }
    
    
    func getAllExam() -> [ExamEntity]? {
        
        guard let result = getAll() else { return nil }
        return result
    }
   
    
    
   
    
    
 
    
}
