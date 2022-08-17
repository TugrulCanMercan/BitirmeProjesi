//
//  LoginTextField.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI


struct TTTextField: View {
    
    @State var mockText = ""
    @State var placeHolder = ""
    var body: some View {
        TextField(placeHolder, text: $mockText)
            .modifier(TTTextFieldModifier(text: $mockText))
        
        
        
    }
    
    
}




struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        TTTextField()
    }
}
