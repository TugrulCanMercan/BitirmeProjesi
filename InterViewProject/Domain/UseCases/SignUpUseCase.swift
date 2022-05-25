//
//  SignUpUseCase.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation


final class SignUpUseCase{
    private let authRepo:AuthRepositoryProtocol
    
    
    init(authRepo:AuthRepositoryProtocol){
        self.authRepo = authRepo
    }
    
    
    
    
    func signUp(userSignUpInformation:UserSignUpEntity,completionHandler: @escaping (Result<ResponseMessage,Error>)->Void){
        authRepo.signUp(userSignUpInformation: userSignUpInformation, completionHandler: completionHandler)
    }
}
