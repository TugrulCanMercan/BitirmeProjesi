//
//  TTButton.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI

struct TTButton: View {
    var text: String
    var icon: Image?
    let color:Color
    
    var clicked: (() -> Void)
    
    init(text:String,icon:Image? = nil,clicked:@escaping (() -> Void),color:Color){
        self.text = text
        self.icon = icon
        self.clicked = clicked
        self.color = color
    }
    var body: some View {
        Button {
            clicked()
        } label: {
            
            Text(text)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue, lineWidth: 4)
                )
            
            
            
            
        }
        
    }
}

struct TTButton_Previews: PreviewProvider {
    static var previews: some View {
        TTButton(text: "selam", icon: Image(systemName: "person"), clicked: {
            print("selam")
        }, color: .red)
    }
}
