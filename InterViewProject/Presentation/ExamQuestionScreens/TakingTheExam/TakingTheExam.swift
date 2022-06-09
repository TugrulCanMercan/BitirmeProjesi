//
//  TakingTheExam.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 8.06.2022.
//

import SwiftUI
import TTComponents

struct TakingTheExam: View {
    @StateObject var takingVM:TakingTheExamViewModel = TakingTheExamViewModel()
    var body: some View {
        NavigationView{
            TTView(content: {
                VStack(spacing:8){
                    Text("Sınav Kodunu Giriniz")
                        .font(.title)
                        .frame(maxWidth: .infinity,alignment: .center)
                    TTTextField(placeHolder: "Sınav Numarsı Giriniz", errorhanlde: "", text: $takingVM.examId)
                
                    if takingVM.goToExamCheck {
                        NavigationLink(isActive:$takingVM.examModel.wrappedValue == nil ? .constant(false): .constant(true)) {
                            if let exam = takingVM.examModel {
                                ExamView(examVM: ExamViewModel(exam: exam))
                            }
                            
                        } label: {

                            Button {
                                takingVM.getExam()
                            } label: {
                                RoundedRectangle(cornerRadius: 8)
                                    .overlay {
                                        Text("Sınava Git")
                                            .foregroundColor(.white)

                                    }
                                    
                                    .frame(height: 55)

                            }
                        }
                    }
                        
                }
                .padding()
            }, popUpContent: {
                
                TTPopUp(push: $takingVM.showPopUp, errorMessage: takingVM.errorPopUp, errorImageName: "multiply.circle.fill")
  
                
            }, showActivate: $takingVM.showPopUp)
            
        }
        
        
    }
}

struct TakingTheExam_Previews: PreviewProvider {
    static var previews: some View {
        TakingTheExam(takingVM: TakingTheExamViewModel())
    }
}
