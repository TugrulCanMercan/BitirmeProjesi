//
//  InterViewProjectApp.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import SwiftUI

@main
struct InterViewProjectApp: App {
    
    let manager  = DIManager.shared
    var body: some Scene {
        WindowGroup {
            
          
//            LoginView()
//            ExamQuestionView()
            TakingTheExam()
//            QuestionAddScene(viewModel: QuestionViewModel(), showActivate: .constant(false), questionContent: [], questionOptions: [:])
//            Test2View()
        }
    }
    
    func tokenCheck(){
        if let token:UserAccessToken? = UserDefaults.standard.object(forKey: "token") as? UserAccessToken{
            
        }
        
    }
}
//struct ScaleButtonStyle: ButtonStyle {
//
//
//    func makeBody(configuration: Self.Configuration) -> some View {
//
//
//        VStack{
//            if( configuration.isPressed){
//
//                configuration.label
//                    .transition(.pivot)
//
//            }else{
//                configuration.label
//                    .foregroundColor(.red)
//                    .background(.red)
//                    .transition(.pivot)
//
//            }
//        }
//        .animation(.easeInOut(duration: 0.2), value:  configuration.isPressed)
//
//
//
//
//    }
//}
//
//struct Test2View: View {
//    var body: some View {
//        Button(action: {}) {
//            RoundedRectangle(cornerRadius: 4).stroke().overlay {
//                Text("buttın")
//            }
//            .frame(width: 100, height: 100, alignment: .center)
//
//        }.buttonStyle(ScaleButtonStyle())
//    }
//}
