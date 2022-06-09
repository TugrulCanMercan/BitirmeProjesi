//
//  QuestionDTO.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.06.2022.
//

import Foundation
import Common

struct QuestionDTO:Codable{
    struct Questions:Codable {
        let questionContent:String
        let questionsList:QuestionOption
        let questionsId:String
        
    }
    struct QuestionOption:Codable{
        let A:String
        let B:String
        let C:String
        let D:String
        let E:String
    }
    let questions:[Questions]
    
}
extension QuestionDTO{
    func toDomain()-> [TTQuestion]{
        return questions.map { questionItem in
            let ttquestion = TTQuestion(UUID: UUID(uuidString: questionItem.questionsId),
                                        category: [], selectedPicker: "",
                                        questionContent: questionItem.questionContent,
                                        quesitons: ["A" : questionItem.questionsList.A,"B" : questionItem.questionsList.B,"C" : questionItem.questionsList.C,"D" : questionItem.questionsList.D,"E" : questionItem.questionsList.E],
                                        questionAnswer: "")
            return ttquestion
        }
        
    }
}

