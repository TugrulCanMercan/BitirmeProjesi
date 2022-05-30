//
//  ExamAddViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 14.05.2022.
//

import Foundation

import Combine

class ExamQuestionViewModel:ObservableObject{

    @Published var questionList:[AddQuestionViewModel] = []
    @Published var examName:String = ""
    var cancellable = Set<AnyCancellable>()
    
    var allQuestion:[TTQuestion] = []
    @Published var entity:[ExamEntity] = []
    @Published var examList:[ExamModel] = []
//    var persistant = DIManager.shared.container.resolve(IExamDraftListRepository.self)
    
    var examManageUsecase = DIManager.shared.container.resolve(CDExamManageUseCase.self,name: "CDExamManageUseCase")
    init(){
        
       
        
        
    }
    
    func examAddQuestion(){
        let addQuestionViewModel = AddQuestionViewModel()
        questionList.append(addQuestionViewModel)
        
    }
    
    func addDraftList() {
        
        $questionList.combineLatest($examName)
            .map { (vmList,examName) -> [ExamModel] in
                let questionList = vmList.map { vm -> ExamModel in
                    let qList = vmList.compactMap({ $0.ttQuestion })
                    let model = ExamModel(id: UUID(), examName: examName, questions: qList)
                    return model
                }
                return questionList
                
                
            }
            .sink { [weak self] examList in
                guard let self = self else { return }
                examList.forEach { exam in
                    _ = self.examManageUsecase?.createExam(Item: exam)
                }
             
            }
            .store(in: &cancellable)


        
//        $questionList.map { vmList -> [TTQuestion] in
//            let qList = vmList.map { vm in
//
//
//                return vm.ttQuestion
//            }
//            return qList
//        }
//        .sink { [weak self] list in
//            guard let self = self else { return }
////            self.persistant?.create(exam: ExamModel(examName: "exam", questions: list))
//            self.examManageUsecase?.createExam(Item: <#T##ExamModel#>)
//            self.allQuestion = list
//        }
//        .store(in: &cancellable)
    
    }
    
    func getDene(){
//        do {
//            let result = try repos.get(byIdentifier: UUID(uuidString: "BF4EA56C-02F2-4181-BD68-A28AEB8FC9FC")!  )
//            print(result.examName)
//            print(result.questions?.first)
//        } catch let err  {
//            print(err)
//        }
       
    }
    
    func getAllExam() {
        
    }
    
    func getExam() {
        let res = examManageUsecase?.getAllExamList()
        res?.forEach({ ent in
            print(ent.id)
        })
        guard let res = res else {
            return
        }
        
        self.examList = res
        
//        let list = res?.map({ entity in
//            let res = ["":""]
//            res[""]
//        })
        
//        let exam = self.persistant?.getExam(predicate: nil)
//
//        if let exam = exam {
//            switch exam {
//
//            case .success(let data):
//                data.forEach { exam in
//                    exam.questions?.forEach({ question in
//                        print(question.questionContent)
//                    })
//                }
//            case .failure(let err):
//                print(err)
//            }
//        }
        
    }
    
}
