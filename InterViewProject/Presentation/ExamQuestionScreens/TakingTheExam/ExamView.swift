//
//  ExamView.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.06.2022.
//

import SwiftUI
import TTComponents

struct ExamView: View {
    @State var show:Bool = false
    @ObservedObject var examVM:ExamViewModel
    @Environment(\.presentationMode) var presentationMode
    init(examVM:ExamViewModel) {
        self.examVM = examVM
    }
    var body: some View {
        TTView(content: {
            ScrollView(.vertical){
                VStack{
                     
                    VStack{
                        ForEach(examVM.question.indices) { item in
                            VStack(alignment:.leading){
                                VStack{
                                    Text("Soru No:\(item + 1)")
                                        .frame(maxWidth:.infinity,alignment:.leading)
                                        .padding(.vertical)
                                    Text(examVM.question[item].questionContent)
                                }
                                VStack{
                                    ForEach(Array(examVM.question[item].quesitons.sorted(by: <).enumerated()),id:\.offset) { val in
                                        HStack{
                                            Text("\(val.element.key) )")
                                                .foregroundColor(examVM.question[item].questionAnswer == val.element.value ? .blue :.black)
                                            Text(val.element.value)
                                                .onTapGesture {
                                                    examVM.question[item].questionAnswer = val.element.value
                                                }
                                        }
                    
                    
                                    }
                    
                                }
                    
                            }
                        }
                    
                        Button {
                            examVM.examTurnIn()
                            withAnimation {
                                presentationMode.wrappedValue.dismiss()
                            }
                            
                            
                        } label: {
                            Text("Sınavı Gönder")
                        }
                    
                    }
                    
                }
            }
        }, popUpContent: {
            
        }, showActivate: $show)
        .padding()
    }
}

struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        ExamView(examVM: ExamViewModel(exam: .init(id: nil, examName: "", questions: [
            TTQuestion(UUID: UUID(), category: [], selectedPicker: "", questionContent: "SWİFT EN GÜZEL DİLMİ bence kesin en güzel dillerden biri", quesitons: ["A":"AŞIKKI"], questionAnswer: "İŞRAET"),
            TTQuestion(UUID: UUID(), category: [], selectedPicker: "", questionContent: "SWİFT EN GÜZEL DİLMİ bence kesin en güzel dillerden biri", quesitons: ["A":"AŞIKKI"], questionAnswer: "İŞRAET")])))
    }
}



