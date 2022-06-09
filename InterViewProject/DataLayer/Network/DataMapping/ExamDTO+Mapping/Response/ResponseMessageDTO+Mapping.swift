//
//  ResponseMessageDTO.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import Foundation



struct ResponseMessageDTO:Codable{
    
    let message:String
}


/// DOMAİN KATMANI İÇİN MAPLEME
extension ResponseMessageDTO {
    func toDomain() -> ResponseMessage {
        return .init(message: message)
    }
}
