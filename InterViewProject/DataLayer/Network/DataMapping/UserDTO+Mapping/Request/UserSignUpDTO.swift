//
//  UserSignUpDTO.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import Foundation


struct UserSignUpDTO:Codable{
    let name:String
    let surname:String
    let password:String
    let email:String
    
}
