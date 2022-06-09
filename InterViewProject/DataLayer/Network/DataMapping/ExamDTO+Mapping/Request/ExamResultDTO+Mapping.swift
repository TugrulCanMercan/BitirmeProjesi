//
//  ExamResultDTO+Mapping.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.06.2022.
//

import Foundation


struct ExamResultDTO:Codable{
    let examId:UUID?
    let examName:String?
    var questions:[TTQuestion]?
    let examStartDate:Date?
    let examEndDate:Date?
}
