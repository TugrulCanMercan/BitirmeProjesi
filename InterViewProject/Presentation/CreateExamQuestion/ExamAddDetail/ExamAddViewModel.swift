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
    @Published var saveButtonCheck:Bool?
    
    let exam:ExamModel?
    
    var examManageUsecase:CDExamManageUseCase?
    let questionExamUsecase:IQuestionAndExamUseCase?
    init(){
        self.questionExamUsecase = DIManager.shared.container.resolve(IQuestionAndExamUseCase.self,name: "IQuestionAndExamUseCase")
        self.examManageUsecase = DIManager.shared.container.resolve(CDExamManageUseCase.self,name: "CDExamManageUseCase")
        saveCheck()
    }
    
    func examAddQuestion(){
        let addQuestionViewModel = AddQuestionViewModel()
        questionList.append(addQuestionViewModel)
        
    }
    
    func addDraftList() {
        
        let questions = questionList.map { vm in
            vm.ttQuestion
        }
        let exam = ExamModel(id: UUID(),
                             examName: examName,
                             questions: questions)
  
        _ = examManageUsecase?.createExam(Item: exam)
 
    }
    

    
    func getAllExam() {
        guard let allExam = self.examManageUsecase?.getAllExamList() else { return }
        self.examList = allExam.filter { examModel in
            examModel.id != nil
        }
        
    }
    
    func getExam(id: UUID) {
        guard let exam = examManageUsecase?.getExam(identifier: id),
              let questions = exam.questions
        else { return }
        self.examName = exam.examName ?? ""
        
        self.questionList = questions.map({ ttquestion -> AddQuestionViewModel in
            let vm = AddQuestionViewModel()
            vm.ttQuestion = ttquestion
            return vm
        })
    }
    
    func saveCheck(){
        $questionList.count()
            .map { val in
                return val >= 5 ? true : false
            }
            .sink {[saveButtonCheck] saveBtnChck in
                self.saveButtonCheck = saveButtonCheck
            }
            .store(in: &cancellable)
    }
    func saveExam(){
        guard let exam = exam else {
            return
        }
        questionExamUsecase?.addExam(exam: exam, completionHandler: { result in
            switch result {
                
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
