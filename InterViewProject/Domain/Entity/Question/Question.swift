//
//  Question.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 28.04.2022.
//

import Foundation

struct TTQuestion:Hashable {
    let UUID:UUID?
    var category:[String]
    var selectedPicker:String
    var questionContent:String
    var quesitons:[String:String]
    var questionAnswer:String
}

extension TTQuestion{
    func options(){
        
    }
}
