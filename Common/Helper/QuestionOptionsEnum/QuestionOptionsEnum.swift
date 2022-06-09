//
//  QuestionOptionsEnum.swift
//  Common
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.06.2022.
//

import Foundation

public enum QuestionOptions:Hashable{
    
    case options(Int)
    
    
    public var result:String{
        switch self {
        case .options(let count):
            switch count{
            case 0: return "A"
            case 1: return "B"
            case 2: return "C"
            case 3: return "D"
            case 4: return "E"
            default:
                return "Hatalı"
            }
        }
    }
    
}
