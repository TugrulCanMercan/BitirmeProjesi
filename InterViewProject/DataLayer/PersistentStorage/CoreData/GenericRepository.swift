//
//  GenericRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 24.05.2022.
//

import Foundation
import CoreData


protocol RepositoryProtocol {
    associatedtype Entity:NSManagedObject
    func create(item: Entity)
    func getAll() -> [Entity]?
    var context : NSManagedObjectContext {get set}
//    func get(byIdentifier id: UUID) -> Entity
//    func update(item: Entity)
//    func delete(record: Entity)
}
extension RepositoryProtocol{
    func create(item: Entity) {
        
        let className = String(describing: Entity.self)
        var managedObject = NSEntityDescription.insertNewObject(forEntityName: className, into: context) as? Entity
        managedObject = item
        do {
            try managedObject?.managedObjectContext?.save()
        } catch let err {
            print("hata alındı \(err)")
        }
        
    }
    
    func getAll() -> [Entity]? {
        let fetchReq = Entity.fetchRequest()
        fetchReq.predicate = nil
        fetchReq.sortDescriptors = nil
        
        
        do {
           let result = try context.fetch(fetchReq) as? [Entity]
            return result
        
        } catch  {
            return nil
        }
        

        
    }
}





final class CoreDataManager {
    
    private init () { }
    
    static let shared = CoreDataManager()
    
    
    lazy var persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExamDraftContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Hata alındı hata açıklaması : \(error)")
            } else {
                print("DB bağlantısı başarılı \(description)")
            }
        }
        return container
        
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]?
    {
        do {
            guard let result = try context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
}
