//
//  ExamSaveView.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import SwiftUI
import TTComponents

struct ExamSaveView: View {
    @ObservedObject var vm:ExamQuestionViewModel
    @Binding var currentShowedView:Selection
    @Environment(\.presentationMode) var presentationMode
    @State var showPopUp:Bool = false
    var body: some View {
        
        TTView(content: {
            NavigationView{
                GeometryReader{proxy in
                    VStack(spacing: 40){
                        
                        NavigationLink {
                            ExamDraftListView(vm: vm)
                                .navigationBarBackButtonHidden(true)
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .overlay {
                                    Text("Tasklakları Görüntüle")
                                }
                                .foregroundColor(.black)
                                .frame(maxHeight: 75)
                                
                        }

                        
                        Button {
                            showPopUp = true
                            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                                showPopUp = false
                                presentationMode.wrappedValue.dismiss()
//                              Hile daha güzel bir yöntem araştır chain animation
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                    vm.addDraftList()
                                    vm.questionList = []
                                    vm.examName = ""
                                    currentShowedView = .showExamQuestion
                                })
                            }
                           
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .overlay {
                                    Text("Sınavi Taslaklara Kaydet")
                                }
                                .foregroundColor(.black)
                                .frame(maxHeight: 75)
                        }
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                currentShowedView = .showExamQuestion
                            })
                        } label: {
                            Text("Çıkmak için tıklayın")
                        }

                        
                        
                        
                    }
                    .padding()
                    .frame(maxHeight: proxy.size.height / 1.75)
                    .navigationTitle("Sınavı Oluştur")
                    
                }
            }
        }, popUpContent: {
            TTPopUp(push: $showPopUp, errorMessage: "Kayıt Başarılı", errorImageName: "checkmark.circle.fill")
        }, showActivate: $showPopUp)
    
    }
}

struct ExamSaveView_Previews: PreviewProvider {
    static var previews: some View {
        ExamSaveView(vm: ExamQuestionViewModel(), currentShowedView: .constant(.showAddQuestionDetail))
    }
}
