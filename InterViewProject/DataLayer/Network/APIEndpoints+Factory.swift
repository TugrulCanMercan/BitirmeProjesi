//
//  ApiEndpoint.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.04.2022.
//

import Foundation
import Infrastructure


struct english:Codable{
    let Word:String
    let turkish:String
    
}

struct APIEndpoints {
    

    static func english() -> Endpoint<[english]>{
        return Endpoint(path: "", method: .get)
    }
    
    
    static func loginUser(userLoginDto:UserLoginRequestDTO)->Endpoint<UserAccessResponseDTO>{
        return Endpoint(path: "auth/login", method: .post,headerParamaters: ["Content-Type":"application/json"],bodyParamatersEncodable: userLoginDto)
    }
   
    static func signUpUser(userSignUp:UserSignUpDTO)->Endpoint<ResponseMessageDTO>{
        return Endpoint(path: "auth/signUp", method: .post,headerParamaters: ["Content-Type":"application/json"],bodyParamatersEncodable: userSignUp)
    }
    
    static func getUser()->Endpoint<UserInformationDTO>{
        let token = UserDefaults.standard.string(forKey: "token")
        return Endpoint(path: "gateway/userService/getUser", method: .get ,headerParamaters: ["Authorization" : "Bearer \(token ?? "")"])
    }
    

    
    
    static func addQuestion()->Endpoint<UserInformationDTO>{
        let token = UserDefaults.standard.string(forKey: "token")
        return Endpoint(path: "gateway/userService/getUser", method: .get ,headerParamaters: ["Authorization" : "Bearer \(token ?? "")"])
    }
    
    enum Exam {
        static func addExam(exam:ExamRequestDTO) -> Endpoint<ResponseMessageDTO> {
//            Gatewayle değişecek değişecek ilerde
            let token = UserDefaults.standard.string(forKey: "token")
            return Endpoint(path: "gateway/ExamAndQuestion/createExam", method: .post, headerParamaters: ["Content-Type":"application/json","Authorization" : "Bearer \(token ?? "")"],bodyParamatersEncodable: exam)
        }
        static func getExamId(examId:GetExamByIdRequestDTO) -> Endpoint<[ExamResponseDto]> {
            let token = UserDefaults.standard.string(forKey: "token")
            return Endpoint(path: "gateway/ExamAndQuestion/getExamId", method: .post, headerParamaters: ["Content-Type":"application/json","Authorization" : "Bearer \(token ?? "")"],bodyParamatersEncodable: examId)
        }
        static func postResultExamTurnIn(exam:ExamResultDTO) -> Endpoint<ResponseMessageDTO> {
            let token = UserDefaults.standard.string(forKey: "token")
            return Endpoint(path: "gateway/ExamAndQuestion/postExamResultTurnIn", method: .post, headerParamaters: ["Content-Type":"application/json","Authorization" : "Bearer \(token ?? "")"],bodyParamatersEncodable: exam)
        }
        
    }
    enum Question {
        static func getAllQuestionId(questionsId:[String]) -> Endpoint<QuestionDTO> {
            let token = UserDefaults.standard.string(forKey: "token")
            return Endpoint(path: "gateway/ExamAndQuestion/getAllQuestionsExam", method: .post,headerParamaters: ["Content-Type":"application/json","Authorization" : "Bearer \(token ?? "")"], bodyParamaters: ["userQuestionLibrary" : questionsId])
        }
    }

}


