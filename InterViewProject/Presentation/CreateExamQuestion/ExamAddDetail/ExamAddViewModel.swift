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
    
//    var persistant = DIManager.shared.container.resolve(IExamDraftListRepository.self)
    var repos = ExamDraftRepo(context: CoreDataManager.shared.context)
    init(){
        
       
        
        
    }
    
    func examAddQuestion(){
        let addQuestionViewModel = AddQuestionViewModel()
        questionList.append(addQuestionViewModel)
        
    }
    
    func addDraftList() {
        $questionList.map { vmList -> [TTQuestion] in
            let qList = vmList.map { vm in
                return vm.ttQuestion
            }
            return qList
        }
        .sink { [weak self] list in
            guard let self = self else { return }
//            self.persistant?.create(exam: ExamModel(examName: "exam", questions: list))
            let exam = ExamEntity(context: CoreDataManager.shared.context)
            let ques = QuestionEntity(context: CoreDataManager.shared.context)
            var setquest = Set<QuestionEntity>()
            ques.quesitons = ["salak":"mall"]
            
            ques.questionContent = "naberlaa"
            setquest.insert(ques)
            
            exam.examName = "salakkk"
            exam.questions = setquest
            self.repos.create(item: exam)
            self.allQuestion = list
        }
        .store(in: &cancellable)
    
    }
    
    func getExam() {
        let res = repos.getAll()
        res?.forEach({ ent in
            ent.questions?.map({ res in
                print(res.questionContent)
            })
        })
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
