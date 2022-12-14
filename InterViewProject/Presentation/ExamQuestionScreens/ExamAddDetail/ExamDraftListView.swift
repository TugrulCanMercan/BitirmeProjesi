//
//  ExamDraftList.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import SwiftUI

struct ExamDraftListView: View {
    
    @ObservedObject var vm: ExamQuestionViewModel
    
    
   
    var body: some View {
        List{
            ForEach(vm.examList) { result in
                if let examName = result.examName,
                   let examId = result.id
                {
                    Button("\(examName)") {
                        vm.getExam(id: examId)
                    }
                }
            }
        }
        .onAppear {
            vm.getAllExam()
        }
    }
}

struct ExamDraftList_Previews: PreviewProvider {
    static var previews: some View {
        ExamDraftListView(vm: ExamQuestionViewModel())
    }
}
