//
//  TTSecureField.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI

struct TTSecureField: View {
    @State var mockText = ""
    @State var placeHolder = ""
    
    
    var body: some View {
        
        
        SecureField(placeHolder, text: $mockText)
            .modifier(TTTextFieldModifier(text: $mockText))
        
        
        
    }
}

struct TTSecureField_Previews: PreviewProvider {
    static var previews: some View {
        TTSecureField()
    }
}
