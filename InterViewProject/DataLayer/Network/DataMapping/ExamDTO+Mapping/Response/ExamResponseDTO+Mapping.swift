//
//  ExamResponseDto.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.06.2022.
//

import Foundation
import Common

//"_id": "0000000a",
//"examTitle": "MERACACACA",
//"examCategory": "java",
//"examStartTime": "2023-04-28T11:45:15.000Z",
//"examEndTime": "2024-04-28T11:45:15.000Z",
//"examQuestions": [
//    "626254d31f2f696c23eee31c",
//    "626255a71f2f696c23eee31f",
//    "626255a71f2f696c23eee31f"
//],
//"examTotalPoint": 5,
struct ExamResponseDto:Codable {
    let _id:String?
    let examTitle:String?
    let examCategory:String?
    let examStartTime:String?
    let examEndTime:String?
    let examQuestions:[String]?
}

extension ExamResponseDto {
    func toDomain() -> ExamModel {
    return ExamModel(id: UUID(uuidString: _id ?? ""), examName: examTitle, questions: examQuestions?.compactMap({ id -> TTQuestion in
            return TTQuestion(UUID: UUID(uuidString: id), category: [], selectedPicker: "", questionContent: "", quesitons: [:], questionAnswer: "")
        }), examStartDate: examStartTime?.convertStringToDate(), examEndDate: examEndTime?.convertStringToDate())
    }
}
