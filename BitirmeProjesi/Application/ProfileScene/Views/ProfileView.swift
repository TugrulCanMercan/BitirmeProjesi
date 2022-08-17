//
//  ProfileView.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 9.04.2022.
//

import SwiftUI



enum MenuItem:String,CaseIterable,Hashable{
    
    case history = "Başarılarım"
    case advancement = "Terfilerim"
    case profileInfo = "Kullanıcı Bilgilerim"
    

}


struct ProfileView:View{
    @State var menu:MenuItem = .advancement
    var body: some View{
        
        CustomNavView {
            
            ScrollView {
                
                  VStack(alignment: .center,spacing: 15){
                   
                      ProfilPhotos()
                      
                   
                      
                      MenuSubView(menu: $menu)
                      
                      
                      if menu == MenuItem.advancement {
                          TTPromotionBar()
                      }else if menu == MenuItem.profileInfo{
                          UserInformationSectionView()
                      }
                      
                      
                      
                          Spacer()
  
                  }
                  .padding(.vertical)
                  .customNavBarItems(title: "Profile", backButtonHidden: true, color: .purple, rightItemShow: true, deneme: {
                      VStack{
                          
                      }
                  })
                  
                  
            }
            
        
         
            
        }

    }
    
    
  
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct MenuSubView: View {
    
    
    @Binding var menu:MenuItem
    var body: some View {
        HStack(spacing:0){
            ForEach (MenuItem.allCases , id :\.self) { idx in
                
                
                Button {
                    menu = idx
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                    
                        .stroke(lineWidth: 3)
                        .overlay(content: {
                            VStack{
                                Text("\(idx.rawValue)")
                                    .font(.subheadline)
                                    .minimumScaleFactor(0.8)
                                    .foregroundColor(Color( #colorLiteral(red: 0.353980124, green: 0.353980124, blue: 0.353980124, alpha: 1)))
                                
                                
                            }
                            
                        })
                        .foregroundColor(menu == idx ? .blue : .yellow)
                        .frame(height : 45)
                    
                }
                .padding(.horizontal,4)
                
            }
        }
    }
}

struct ProfilPhotos: View {
    var body: some View {
        VStack{
            Circle()
            
                .stroke(lineWidth: 3)
                .overlay {
                    Image(systemName: "person")
                    
                        .resizable()
                    
                        .clipShape(Circle())
                }
            
                .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4, alignment: .center)
            
            
            Text("Tuğrul Can MERCAN")
            
                .minimumScaleFactor(0.8)
                .frame(maxWidth : 100)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
    }
}
