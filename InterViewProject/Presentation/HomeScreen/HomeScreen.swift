//
//  HomeScreen.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 8.06.2022.
//

import SwiftUI
import TTComponents

struct HomeScreen: View {
    let data = (1...10).map { "Item \($0)" }
    let columns = [
          GridItem(.flexible()),
          GridItem(.flexible()),

      ]
    var body: some View {
        NavigationView{
            VStack(spacing:20){
                
                NavigationLink {
                    HomeScreen()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .overlay {
                            Text("Sınava girebilmek İçin Sınav Id giriniz")
                        }
                }
                NavigationLink {
                    Text("sonuç ekranı itersayonu")
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .overlay {
                            Text("Sınavlarımı görüntüle")
                        }
                }

               

                
            }
            
            
            .padding()
            
            .frame(maxHeight:200)
            .navigationTitle("Ana Sayfa")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
