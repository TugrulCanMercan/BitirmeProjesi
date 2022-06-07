//
//  UserLoginRequestDTO.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation




struct UserLoginRequestDTO:Codable{
    let email:String
    let password:String
}
