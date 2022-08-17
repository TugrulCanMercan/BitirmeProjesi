//
//  UserInformtion.swift
//  Common
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 10.06.2022.
//

import Foundation

public class UserTT{
    public var user:UserInfo?
    
    public static var shared = UserTT()
    
    
}


public struct UserInfo{
    let _id:String
    let surname:String
    let password:String
    let email:String
    let userQuestionLibrary:[String]?
    let userExamLibrary:[String]?
}
