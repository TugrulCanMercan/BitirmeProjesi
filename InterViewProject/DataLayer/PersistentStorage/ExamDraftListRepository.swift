////
////  ExamDraftListRepository.swift
////  InterViewProject
////
////  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
////
//
//import Foundation
//import CoreData
//
//protocol Repository {
//    /// The entity managed by the repository.
//    associatedtype Entity
//    
//    /// Gets an array of entities.
//    /// - Parameters:
//    ///   - predicate: The predicate to be used for fetching the entities.
//    ///   - sortDescriptors: The sort descriptors used for sorting the returned array of entities.
//    func get(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[Entity], Error>
//    
//    /// Creates an entity.
//    func create() -> Result<Entity, Error>
//
//    /// Deletes an entity.
//    /// - Parameter entity: The entity to be deleted.
//    func delete(entity: Entity) -> Result<Bool, Error>
//}
//
//class CoreDataContextProvider {
//    // Returns the current container view context
//    var viewContext: NSManagedObjectContext {
//        return persistentContainer.viewContext
//    }
//    
//    // The persistent container
//    private var persistentContainer: NSPersistentContainer
//    
//    init(completionClosure: ((Error?) -> Void)? = nil) {
//        // Create a persistent container
//        persistentContainer = NSPersistentContainer(name: "ExamDraftContainer")
//        persistentContainer.loadPersistentStores() { (description, error) in
//            if let error = error {
//                fatalError("Failed to load Core Data stack: \(error)")
//                
//            }
//            completionClosure?(error)
//        }
//    }
//    // Creates a context for background work
//    func newBackgroundContext() -> NSManagedObjectContext {
//        return persistentContainer.newBackgroundContext()
//    }
//}
//
//enum CoreDataError: Error {
//    case invalidManagedObjectType
//}
//
//class CoreDataManager<T: NSManagedObject>: Repository{
//    
//    typealias Entity = T
//    
//    private let managedObjectContext: NSManagedObjectContext
//    
//    init(managedObjectContext: NSManagedObjectContext) {
//        self.managedObjectContext = managedObjectContext
//    }
//    
//    func get(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[T], Error> {
//        let fetchRequest = Entity.fetchRequest()
//        fetchRequest.predicate = predicate
//        fetchRequest.sortDescriptors = sortDescriptors
//        do {
//            // Perform the fetch request
//            if let fetchResults = try managedObjectContext.fetch(fetchRequest) as? [Entity] {
//                return .success(fetchResults)
//            } else {
//                return .failure(CoreDataError.invalidManagedObjectType)
//            }
//        } catch {
//            return .failure(error)
//        }
//    }
//    
//    
//    func getContext() -> NSManagedObjectContext {
//        return managedObjectContext
//    }
//    
//    func create() -> Result<T, Error> {
//        let className = String(describing: Entity.self)
//       
//        guard let managedObject = NSEntityDescription.insertNewObject(forEntityName: className, into: managedObjectContext) as? Entity else {
//            return .failure(CoreDataError.invalidManagedObjectType)
//        }
//        return .success(managedObject)
//    }
//    
//    func delete(entity: T) -> Result<Bool, Error> {
//        managedObjectContext.delete(entity)
//        return .success(true)
//    }
//    
//    
//    
//    
//}
//
//protocol IExamDraftListRepository {
//    func getExam(predicate: NSPredicate?) -> Result<[ExamModel], Error>
//    // Creates a book on the persistance layer.
//    func create(exam: ExamModel) -> Result<Bool, Error>
//}
//
//class ExamDraftListRepository {
//    private let repository: CoreDataManager<ExamEntity>
//    
//    /// Designated initializer
//    /// - Parameter context: The context used for storing and quering Core Data.
//    init(context: NSManagedObjectContext) {
//        self.repository = CoreDataManager<ExamEntity>(managedObjectContext: context)
//    }
//}
//extension ExamDraftListRepository: IExamDraftListRepository {
//    func getExam(predicate: NSPredicate?) -> Result<[ExamModel], Error> {
//        let result = repository.get(predicate: predicate, sortDescriptors: nil)
//        
//        switch result {
//        case .success(let examMO):
//            // Transform the NSManagedObject objects to domain objects
////            print(examMO.first?.questions?.allObjects)
//            examMO.map { examEntity in
//                let questionSet = Set<QuestionEntity>()
//                let questionEntity = QuestionEntity(context: repository.getContext())
//                
//                examEntity.questions
//            }
//            
//            
//            return .success([])
//        case .failure(let error):
//            // Return the Core Data error.
//            return .failure(error)
//        }
//    }
//    
//    func create(exam: ExamModel) -> Result<Bool, Error> {
//        let result = repository.create()
//        switch result {
//        case .success(let examMO):
//            // Update the book properties.
//    
//            
//            examMO.examName = exam.examName
//            var questionSet = Set<QuestionEntity>()
//            exam.questions?.forEach({ question in
//                
//                let questionEntity = QuestionEntity(context: repository.getContext())
//                questionEntity.questionContent = question.questionContent
//                questionSet.insert(questionEntity)
//                
//            })
//            examMO.questions = questionSet
//            
//            
//            
//            
//            
//            
//          
//
//            do {
//                try examMO.managedObjectContext?.save()
//                return .success(true)
//            } catch let err {
//                print(err)
//                return.failure(err)
//            
//            }
//            
//            
//        case .failure(let error):
//            // Return the Core Data error.
//            return .failure(error)
//        }
//    }
//    
//    
//}
//
//
//
//
//
//
//
//
//
////class ExamDraftListRepository{
////
////
////
////    lazy var persistentContainer: NSPersistentContainer = {
////
////        let container = NSPersistentContainer(name: "ExamDraftContainer")
////
////        container.loadPersistentStores { _, error in
////
////            if let error = error as NSError? {
////
////                print("Core data yüklenemedi")
////                fatalError("Unresolved error \(error), \(error.userInfo)")
////            }else{
////                print("Core data yüklendi")
////            }
////        }
////        return container
////    }()
////
////
////    func fetchObject<T:NSManagedObject>(entity:T.Type, predicate:NSPredicate? = nil, sortDescription: [NSSortDescriptor]? = nil, context:NSManagedObjectContext){
////
////    }
////
////    func fetchExam() -> [ExamEntity]{
////        let request = NSFetchRequest<ExamEntity>(entityName: "ExamEntity")
////        var examList:[ExamEntity] = []
////        do {
////            examList = try persistentContainer.viewContext.fetch(request)
////        } catch let error {
////            print(error)
////        }
////        return examList
////    }
////
////    func addExam(questionList:[TTQuestion]) {
////        let exam = ExamEntity(context: persistentContainer.viewContext)
////
////        questionList.forEach { ttquestion in
////            let questions = QuestionEntity(context: persistentContainer.viewContext)
////            exam.examName = "Tugrul Sınavı"
////            questions.questionAnswer = ttquestion.questionAnswer
////            questions.quesitons = ttquestion.quesitons
////            questions.questionContent = ttquestion.questionContent
////            questions.category = ttquestion.category
////            questions.selectedPicker = ttquestion.selectedPicker
////            exam.addToQuestions(questions)
////        }
////        saveData()
////    }
////    func saveData() {
////        do {
////            try persistentContainer.viewContext.save()
////        } catch let err {
////            print("kayıt hatası \(err)")
////        }
////
////    }
////
////}
//
