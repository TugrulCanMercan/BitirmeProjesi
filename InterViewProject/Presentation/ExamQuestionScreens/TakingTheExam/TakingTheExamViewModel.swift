//
//  TakingTheExamViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 8.06.2022.
//

import Foundation
import Combine

class TakingTheExamViewModel: ObservableObject {
    @Published var examId:String = ""
    @Published var goToExamCheck:Bool = false
    var examUsecase:IQuestionAndExamUseCase
    var cancellable = Set<AnyCancellable>()
    @Published var errorPopUp:String = ""
    @Published var showPopUp:Bool = false
    @Published var examModel:ExamModel?
    init(){
        self.examUsecase = DIManager.shared.container.resolve(IQuestionAndExamUseCase.self,name: "IQuestionAndExamUseCase")!
        examIdControl()
    }
    
    func examIdControl() {
        $examId.map { id in
            id.isEmpty ? false : true
        }
        .sink { [weak self] result in
            guard let self = self else { return }
            self.goToExamCheck = result
        }
        .store(in: &cancellable)
    }
    func getExam(){

        examUsecase.getAllExam(examId: examId) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let exam):
                self.examModel = exam.data
            case .failure(_):
                self.errorPopUp = "Sınav Bulunamadı"
                self.showPopUp = true
            }
        }
        
    }
    
}
