//
//  ContentView.swift
//  Instagram-Demo-App
//
//  Created by Shwait Kumar on 19/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("home")
                }
            Text("Search")
                .tabItem {
                    Image("search")
                }
            Text("Reels")
                .tabItem {
                    Image("reels")
                }
            Text("Shop")
                .tabItem {
                    Image("shop")
                }
            Text("Globe")
                .tabItem {
                    Image("more")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
