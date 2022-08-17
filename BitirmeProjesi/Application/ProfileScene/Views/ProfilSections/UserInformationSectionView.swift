//
//  UserInformationSectionView.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 14.04.2022.
//

import SwiftUI
import LocalAuthentication

struct UserInformationSectionView: View {
    @State private var enableLogging = false
    @State var selectedColor = ""
    @State private var colors = ["Red", "Green", "Blue"]
    @State var authCheckAlertContainer = false
    
    @State var authCheck = false
    
    
    var body: some View {
        
        CustomNavView{
            Form {
                
                
                Section {
                    TextField("İSİM", text: $selectedColor)
                    
                    TextField("SOYAD", text: $selectedColor)
                    
                } header: {
                    Text("Kullanıcı Bilgileri")
                    
                }
                
                Section {
                    if(!authCheck){
                        Button {
                            authenticate()
                        } label: {
                            Text("Şifre Değiştirme")
                                .foregroundColor(.black)
                        }
                    }else{
                        NavigationLink("Şifre Değiştirme", isActive: $authCheck) {
                            Text("Şifre Kontrol")
                        }
                    }

                } header: {
                    Text("Gizlilik ve Parola")
                }

                Section(footer: Text("Note: Enabling logging may slow down the app")) {
                    Toggle("Enable Logging", isOn: $enableLogging)
                    
                    
                }
                
                Section {
                    Button("Save changes") {
                        // activate theme!
                    }
                }
            }
            
            .customNavigationBarBackButtonHidden(true)
            .customNavigationTitle("Profilini Düzenle")
            .customNavigationBarColor(.yellow)
        }
        
        
        
    }
    
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        
        
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    
                    authCheck = true
                } else {
                    // there was a problem
                    authCheckAlertContainer = true
                    
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct UserInformationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationSectionView()
    }
}


//VStack{
//
//
//
//        Capsule()
//            .stroke(lineWidth: 3)
//            .foregroundColor(.yellow)
//
//            .overlay(
//                HStack{
//                    Text("Kullanıcı Adı : ")
//                        .font(.headline)
//
//                    TextField("Kullanıcı Adı", text: $username)
//                        .font(.subheadline)
//                        .textCase(.lowercase)
//                }
//                    .padding(.horizontal)
//
//            )
//
//
//
//
//}
//.frame(height: 40, alignment: .center)
