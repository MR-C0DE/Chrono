//
//  ContentView.swift
//  Chrono
//
//  Created by Andre Mulaja on 2022-04-29.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView{
            
            Miniteur()
                .tabItem {
                    Label("Miniteur", systemImage: "timer")
                }
            
            Chronometre()
                .tabItem {
                    Label("Chronomètre", systemImage: "stopwatch.fill")
                }
            
            Alarme()
                .tabItem {
                    Label("Alarme", systemImage: "alarm.fill")
                }
            
            
        }.accentColor(.yellow)
        
       
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// lien pour la couleur de tabView https://stackoverflow.com/questions/56969309/change-tabbed-view-bar-color-swiftui
