//
//  UserInformation.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation

struct UserInformationDTO: Codable{
    let _id:String
    let surname:String
    let password:String
    let email:String
    let userQuestionLibrary:[String]?
    let userExamLibrary:[String]?
}

extension UserInformationDTO{
    
    
    func toDomain()->UserInfo{
        .init(_id: _id, surname: surname, password: password, email: email, userQuestionLibrary: userQuestionLibrary, userExamLibrary: userExamLibrary)
    }
    
    
}
