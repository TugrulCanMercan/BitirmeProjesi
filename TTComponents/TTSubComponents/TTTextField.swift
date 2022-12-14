//
//  CustomTextField.swift
//  TTComponents
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 21.04.2022.
//

import SwiftUI
import Combine

class viewModel:ObservableObject{
    
    @Published var error:String = ""
    @Published var text = ""
    var cancellable = Set<AnyCancellable>()
    init(){
        $text
            .receive(on: DispatchQueue.main)
            .sink { str in
                if str.count == 5{
                    
                        self.error = "hata geldi"
                    
                       
                    
                 
                }else{
                    
                        self.error = ""
                    
                
                }
            }
            .store(in: &cancellable)
    }
    
}
struct viewCanvas:View{
    @StateObject var vm = viewModel()
    var body: some View{
        VStack{
            TTTextField(placeHolder: "place", errorhanlde: vm.error, text: $vm.text)
            Button("ds") {
              
                    vm.error = "dsadsa"
                
                
                
              
            }
        }
       
    }

}



public struct TTTextField: View {
    @State var placeHolder:String
    var errorhanlde:String
    @Binding var text:String
    public init(
        placeHolder:String,
        errorhanlde:String = "",
        text:Binding<String>
    ){
        self._text = text
        self.errorhanlde = errorhanlde
        self.placeHolder = placeHolder
    }
    
    
    public var body: some View {
        
        
        
        
        VStack(alignment:.leading){
            GeometryReader{geo in
                VStack(alignment:.leading){
                    
                    VStack{
                        if !errorhanlde.isEmpty{
                            Text(errorhanlde)
                                .foregroundColor(.red)
                                .font(.caption)
                                .offset(x: 10, y: 0)
                                .transition( .offset(x: 0, y: 50).combined(with: .opacity))
                                .frame(height:20)
                        }else{
                            Color.clear
                                .frame(height:20)
                                
                        }
                    }
                    .animation(.easeOut, value: errorhanlde)
                    TextField(placeHolder, text: $text)
                        .modifier(TTTextFieldModifier(text: $text))
                    
                }

            }

        }

        .frame(height: 75)
        
        
    }
}




struct CustomTextField_Previews: PreviewProvider {
    
    
    static var previews: some View {
        viewCanvas()
            
        
    }
}
