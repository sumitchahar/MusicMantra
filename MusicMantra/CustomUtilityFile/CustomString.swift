//
//  CustomString.swift
//  MusicMantra
//
//  Created by Sumit on 13/05/24.
//

import Foundation

//title:"Home", icon:"house.fill"))
//AnyView(tabBarView(AudioPlayListView(), title:"Search", icon:"magnifyingglass"))
//AnyView(tabBarView(AudioPlayListView(), title:"My Playlist", icon:"headphones.circle"))
//AnyView(tabBarView(AudioPlayListView(), title:"Preminum", icon:"music.note"))
//    @StateObject var audioFileTracker = AudioFileTracker()
//    @State var height:CGFloat = UIScreen.main.bounds.height
//    @State var istabSelect:Bool = false
//    @State var isPlay:Bool = false
//    @State var isOverlay:Bool = false
//    @State  var isShowingDetailView = false
    // .toolbar(istabSelect == false ? .visible : .hidden, for: .tabBar)



 enum TabBarBottomString: String, CaseIterable {
     
      case Home
      case Search
      case My_Playlist
      case Preminum
     
     var stringValue:String {
          switch self {
            case .Home:  return "Home"
            case .Search:  return "Search"
            case .My_Playlist:  return "My Playlist"
            case .Preminum:  return "Preminum"
        }
     }
  }

 enum TabBarBottomIcon: String, CaseIterable {
     
     case Home
     case Search
     case My_Playlist
     case Preminum 
     
     var icon:String {
          switch self {
            case .Home:  return "house.fill"
            case .Search:  return "magnifyingglass"
            case .My_Playlist:  return "headphones.circle"
            case .Preminum:  return "music.note"
        }
     }
  }

