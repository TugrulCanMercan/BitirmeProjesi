//
//  SignUp.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI
struct SingUpView: View {
    @State var mockData:String = ""
    
    var body: some View {
        
        
        CustomNavView {
            VStack{
                
                TTTextField(mockText: mockData, placeHolder: "Kullanıcı adı")
                
                TTTextField(mockText: mockData, placeHolder: "Mail Adresi")
                
                TTTextField(mockText: mockData, placeHolder: "Şifre")
                
              
               
                
             
                    TTButton(text: "Kayıt Ol", clicked: {
                        print("")
                    }, color: .blue)
                

                
            }
            
            .customNavigationBarBackButtonHidden(true)
            .customNavigationTitle("Online Terfi Login")
            .customNavigationBarColor(.yellow)
            .frame(maxHeight: .infinity)
            
        }
        
       
    }
    
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
