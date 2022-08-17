//
//  ContentView.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI

struct LoginView: View {
    @State var mockData:String = ""
    
    var body: some View {
        
        
        CustomNavView {
            VStack{
                
                TTTextField(mockText: mockData, placeHolder: "Mail Adresi")
                
                TTSecureField(mockText: mockData, placeHolder: "Şifre")
                
               
                
                VStack{
                    TTButton(text: "Giriş Yap", clicked: {
                        print("")
                    }, color: .blue)
                    LabelledDivider(label: "Yada")
                    TTButton(text: "Kayıt Olmak İçin", clicked: {
                        print("")
                    }, color: .blue)
                }
          
                
            }
            
            .customNavigationBarBackButtonHidden(true)
            .customNavigationTitle("Online Terfi Login")
            .customNavigationBarColor(.yellow)
            .frame(maxHeight: .infinity)
            
        }
        
       
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
