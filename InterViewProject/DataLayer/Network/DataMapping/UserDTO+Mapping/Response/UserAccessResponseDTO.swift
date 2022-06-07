//
//  UserAccessResponseDTO.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation


struct UserAccessResponseDTO:Codable{
    
    let status:Bool
    let message:String
    let data:Token
}



extension UserAccessResponseDTO{
    struct Token:Codable{
        let access_token:String
        let refresh_token:String
    }
}

extension UserAccessResponseDTO{
    
    
    func toDomain() -> UserAccessToken{
        .init(token: self.data.access_token, refreshToken: self.data.refresh_token)
    }
}
