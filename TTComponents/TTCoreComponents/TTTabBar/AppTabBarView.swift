//
//  AppTabBarView.swift
//  BitirmeProjesi
//  
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI


public struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    public init(selection:String,tabSelection:TabBarItem){
        self.selection = selection
        self.tabSelection = tabSelection
    }
    
    public var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            TestTabView(text: "1")
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            TestTabView(text: "2")
                .tabBarItem(tab: .messages, selection: $tabSelection)

            TestTabView(text: "3")
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            TestTabView(text: "4")
                .tabBarItem(tab: .favorites, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView(selection: "", tabSelection: .home)
    }
}

extension AppTabBarView {
    
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
    
}

struct TestTabView: View {
    
    let text: String
    @State private var textFieldText: String = ""
    
    init(text: String) {
        self.text = text
        print("INIT" + text)
    }
    
    var body: some View {
        VStack {
            Text(text)
                .onAppear {
                    print("ONAPPEAR" + text)
            }
            TextField("Type something...", text: $textFieldText)
                .disableAutocorrection(true)
            
        }
    }
}
