//
//  ProfileViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation
import Common


final class ProfileViewModel:ObservableObject{
    
    let userInformationUseCase:GetUserUseCase = DIManager.shared.container.resolve(GetUserUseCase.self, name: "GetUserUseCaseDI")!
    
    @Published var userInfo:UserInfo?
    
    
    init(){
        
        getUser()
        
    }
    
    func getUser(){
        userInformationUseCase.getUser { result in
            switch result{
                
            case .success(let data):
                self.userInfo = data
                UserDefaults.standard.set(data._id, forKey: "UserId")
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
}
