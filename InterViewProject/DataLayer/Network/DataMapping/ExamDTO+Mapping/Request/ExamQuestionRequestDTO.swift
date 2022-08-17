//
//  ExamRequestDTO.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 6.06.2022.
//

import Foundation


struct ExamRequestDTO: Codable {
    let UUID:String
    let examTitle:String?
    let examCategory:String?
    let examStartTime:Date?
    let examEndTime:Date?
//    examQuestions UUID stringListesi olcak
    let examQuestions:[String]?
    let examTotalPoint:Int?
}

