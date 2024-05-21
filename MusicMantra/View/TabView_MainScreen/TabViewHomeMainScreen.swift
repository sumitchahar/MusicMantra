//
//  ContentView.swift
//  MusicMantra
//
//  Created by Sumit on 11/05/24.
//

import SwiftUI

 struct TabViewHomeMainScreen: View {

  @ObservedObject var audioFileTracker = AudioFileTracker()

  var body: some View {
     NavigationView {
        ZStack {
          TabView {
              AnyView(tabBarView(AudioPlayListView(audioFileTracker: audioFileTracker), title:TabBarBottomString.Home.stringValue, icon:TabBarBottomIcon.Home.icon))
              AnyView(tabBarView(AudioPlayListView(audioFileTracker: audioFileTracker), title:TabBarBottomString.Search.stringValue, icon:TabBarBottomIcon.Search.icon))
              AnyView(tabBarView(AudioPlayListView(audioFileTracker: audioFileTracker), title:TabBarBottomString.My_Playlist.stringValue, icon:TabBarBottomIcon.My_Playlist.icon))
              AnyView(tabBarView(AudioPlayListView(audioFileTracker: audioFileTracker), title:TabBarBottomString.Preminum.stringValue, icon:TabBarBottomIcon.Preminum.icon))
              }.accentColor(Color.white)
               .onAppear() { UITabBar.appearance().barTintColor = .black }
               if audioFileTracker.audioSelectItemsList.count > 0 {
                    BottomHeaderView(audioFileTracker:audioFileTracker)
               }
            }
        }
    }
 }

  extension View {
      public func tabBarView(_ view:any View, title:String, icon:String) -> any View {
          return view.tabItem { Label(title, systemImage: icon) }
      }
  }

  #Preview {
      TabViewHomeMainScreen()
 }


