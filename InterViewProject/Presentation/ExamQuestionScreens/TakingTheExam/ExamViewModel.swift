//
//  ExamViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.06.2022.
//

import Foundation


final class ExamViewModel:ObservableObject{
    @Published var exam:ExamModel
    @Published var examTitle:String = ""
    @Published var question:[TTQuestion] = []
    let examQuestionUseCase:IQuestionAndExamUseCase = DIManager.shared.container.resolve(IQuestionAndExamUseCase.self,name: "IQuestionAndExamUseCase")!
    init(exam:ExamModel){
        self.exam = exam
        self.publisherLoadInstance(exam: exam)
    }
    
    func publisherLoadInstance(exam:ExamModel) {
        guard let title = exam.examName,
              let questionList = exam.questions
        else {return }
        self.examTitle = title
        self.question = questionList
    }
    
    
    func examTurnIn(){
        exam.questions = question
        examQuestionUseCase.postResultExamTurnIn(exam: exam) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error)
            }
        }
    }
}
