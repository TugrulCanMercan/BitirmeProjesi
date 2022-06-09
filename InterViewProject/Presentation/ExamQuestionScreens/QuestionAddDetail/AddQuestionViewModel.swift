//
//  AddQuestionViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 28.04.2022.
//

import Foundation
import Combine
import SwiftUI
import Common



class AddQuestionViewModel:ObservableObject,Identifiable,Equatable{
    static func == (lhs: AddQuestionViewModel, rhs: AddQuestionViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID().uuidString
    @Published var title:String = ""
    @Published var showPicker = false
    /// Beckend ten gelecek
    @Published var image:UIImage?
    
    @Published var ttQuestion:TTQuestion = TTQuestion(UUID: nil, category: ["Swift","TypeScript"], selectedPicker: "", questionContent: "", quesitons: ["":""], questionAnswer: "")
    
    @Published var saveButtonDisabled = true
    
    
    //    @Published var questionList:[Question] = [Question(selectedPickere:"",questionContent: "dsa", questionOptions: ["":""], questionAnswer: "dsads")]
    @Published var questions:[String] = []
    
    
    
    var cancellable = Set<AnyCancellable>()
    
    
    
    init(){
        
        
        
        questionAllSatisfy()
        examAddQuestion()
    }
    
    func questionAllSatisfy(){
        
        $ttQuestion.map { ttquestion in
            ttquestion.quesitons
        }
        .map { options -> Bool in
            let check = options.allSatisfy { key,val in
                return (!key.isEmpty && !val.isEmpty)
            }
            if options.keys.count >= 5 && check {
                return false
            }else{
                return true
            }
        }
        .sink {[weak self] val in
            guard let self = self else {return }
            self.saveButtonDisabled = val
        }
        .store(in: &cancellable)
        //        $ttQuestion.map { question in
        //            question.quesitons
        //        }.map { quesitonOption -> Bool in
        //            let check = quesitonOption.allSatisfy { str in
        //                !str.isEmpty
        //            }
        //            if quesitonOption.count >= 5 && check {
        //                return false
        //            }else{
        //                return true
        //            }
        //        }
        //        .sink {[weak self] val in
        //            guard let self = self else {return }
        //            self.saveButtonDisabled = val
        //        }
        //        .store(in: &cancellable)
        
        
    }
    
    func examAddQuestion(){
        
        $questions.map { questions -> [String:String] in
            var questionOptions:[String:String] = [:]
            
            for item in questions.indices{
                questionOptions[QuestionOptions.options(item).result] = questions[item]
            }
            return questionOptions
        }
        .sink {[weak self] options in
            guard let self = self else { return }
            self.ttQuestion.quesitons = options
            
        }
        .store(in: &cancellable)
        
        
       
        
        
        
        
    }
    
    func getCategory(){
        
//        if !saveButtonDisabled {
//            var questionOptions:[String:String] = [:]
//            for item in questions.indices{
//                questionOptions[QuestionOptions.options(item).result] = questions[item]
//            }
//            ttQuestion
//            let question = Question(selectedPickere: selectedPickere, questionContent: questionContent, questionOptions: questionOptions, questionAnswer: selectedPickere)
//            
//            print(question)
//        }
    }
}
