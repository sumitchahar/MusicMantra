//
//  AudioPlayList.swift
//  MusicMantra
//
//  Created by Sumit on 12/05/24.
//

import Foundation

struct AudioPlayList:Equatable {
   
   var id:UUID = UUID()
   var img:String
   var audioFile:String
     
 }

struct AudioItemsList:Equatable {
   
    var id:UUID = UUID()
    var img:String
    var audioFileName:String
    var audioSubName:String
    var audioFileURl:String
    var isAudioPaly:Bool = false

 }
