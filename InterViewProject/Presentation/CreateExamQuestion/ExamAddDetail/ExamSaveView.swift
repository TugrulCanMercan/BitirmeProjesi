//
//  ExamSaveView.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import SwiftUI

struct ExamSaveView: View {
    @ObservedObject var vm:ExamQuestionViewModel
    var body: some View {
        NavigationView{
            GeometryReader{proxy in
                VStack(spacing: 40){
                    
                    Button {
                        vm.getDene()
                    } label: {
                        Text("getirr")
                    }

                    
                    NavigationLink {
                        ExamDraftListView(vm: vm)
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .overlay {
                                Text("Tasklaklara Kaydet")
                            }
                            .foregroundColor(.black)
                            .frame(maxHeight: 75)
                    }
                    
                    Button {
                        vm.getExam()
                    } label: {
                        Text("neler oluyor")
                    }

                    
                    Button {
                        vm.addDraftList()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .overlay {
                                Text("Sınavi Olştur")
                            }
                            .foregroundColor(.black)
                            .frame(maxHeight: 75)
                    }
                    
                    
                    
                    
                }
                .padding()
                .frame(maxHeight: proxy.size.height / 1.75)
                .navigationTitle("Sınavı Oluştur")
                
            }
            
            
            
            
            
        }
    }
}

struct ExamSaveView_Previews: PreviewProvider {
    static var previews: some View {
        ExamSaveView(vm: ExamQuestionViewModel())
    }
}
