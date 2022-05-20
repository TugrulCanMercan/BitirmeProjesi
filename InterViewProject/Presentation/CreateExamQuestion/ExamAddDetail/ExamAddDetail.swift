//
//  ExamAddDetail.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 13.05.2022.
//

import SwiftUI
import TTComponents

struct Post:Identifiable{
    var id =  UUID().uuidString
    var postImage:String
}

struct ExamAddDetail: View {
    
    
    @State private var offset = CGFloat.zero
    
    @Binding var currentShowedView:Selection
    
    @StateObject var VM = ExamQuestionViewModel()
    @State var show = true
    @State var index:Int = 0
    
    @State var showingSheet = false
    var body: some View {
        VStack{
            
            
            
            if VM.questionList.isEmpty{
                VStack{
                    Text("Sınav Oluştruma")
                        .font(.largeTitle)
                        .padding(.vertical)
                    Spacer()
                    GeometryReader { proxy in
                        VStack{
                            TextField("Sınav Adı Giriniz", text: $VM.examName)
                                .background(
                                    Divider()
                                        .offset( y: 20)
                                )
                                .padding(.bottom)
                        }
                        .frame(height: proxy.size.height / 3)
                    }
                    
                    
                    Spacer()
                    Button {
                        VM.examAddQuestion()
                    } label: {
                        Text("Soru Eklemeye Başla")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical)
                }
                .padding()
                
                
            }else{
                TabView(selection: $index) {
                    
                    
                    
                    ForEach(Array(VM.questionList.enumerated()),id:\.offset) { (idx,vm) in
                        VStack(spacing:0){
                            HStack{
                                Text("Soru Numarası \(index)")
                                Spacer()
                                Button("Sınavı Kaydet") {
                                    showingSheet.toggle()
                                }
                                .sheet(isPresented: $showingSheet) {
                                    ExamSaveView()
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            .frame(maxWidth: .infinity)
                         
                            
                            AddQuestionDetailView(examOrQuestion: false, currentShowedView: $currentShowedView, VM: vm)
                                .tag(idx)
                            Button {
                                VM.examAddQuestion()
                                
                            } label: {
                                Text("Soru Eklemeye Devam Et")
                            }
                            .padding()
                        }
                        .background(Color(UIColor.systemGray6))
                        .onChange(of: VM.questionList) { newValue in
                            withAnimation {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
                                    withAnimation (.easeIn(duration: 50)){
                                        index = newValue.endIndex - 1
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()
            }
        }
        
        
        
    }
}
struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ExamAddDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExamAddDetail(currentShowedView: .constant(.showExamQuestion))
    }
}


