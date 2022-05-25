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


class ExamDraftRepo:ExamDraftProtocol{
    var context: NSManagedObjectContext
    
    typealias Entity = ExamEntity
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    func getAllExam(){
        let resul = getAll()
    }
}
