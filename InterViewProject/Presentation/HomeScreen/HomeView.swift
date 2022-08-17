//
//  HomeView.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI
import TTComponents

struct HomeView: View {
    
    @State private var selection: String = "profile"
    @State private var tabSelection: TabBarItem = .profile
    var body: some View {
        
        
        CustomTabBarContainerView(selection: $tabSelection) {
            ExamQuestionView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            ProfileView()
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
        
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



struct Profile:View{
    var body: some View{
        CustomNavView {
            VStack{
                Text("dsadsa")
                Text("dsadsa")
            }
            .customNavigationBarBackButtonHidden(true)
            .customNavigationTitle("Profil")
            .customNavigationBarColor(.yellow)
            
        }

    }
  
}

//@State private var selection: String = "home"
//@State private var tabSelection: TabBarItem = .home
//
//var body: some View {
//    CustomTabBarContainerView(selection: $tabSelection) {
//        TestTabView(text: "1")
//            .tabBarItem(tab: .profile, selection: $tabSelection)
//
//        TestTabView(text: "2")
//            .tabBarItem(tab: .messages, selection: $tabSelection)
//
//        TestTabView(text: "3")
//            .tabBarItem(tab: .home, selection: $tabSelection)
//
//        TestTabView(text: "4")
//            .tabBarItem(tab: .favorites, selection: $tabSelection)
//    }
//    .ignoresSafeArea(.keyboard, edges: .bottom)
//}
