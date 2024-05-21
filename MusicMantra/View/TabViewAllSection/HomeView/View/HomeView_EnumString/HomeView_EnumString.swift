//
//  HomeView_EnumString.swift
//  MusicMantra
//
//  Created by Sumit on 16/05/24.
//

import Foundation

 enum AudioPlayFullScreenEnum {
    
    case RepeatIcon
    case Backward_end
    case Pause_fill
    case Play_fill
    case Forward_end
    case Heart_fill
    case Point_forward_to_Point_capsulepath
    case Arrowshape_down_fill
    case Arrowshape_turn_up_forward_fill
    case Music_note_list
    case Chevron_up
    case Arrow_backward
    case Ellipsis

    var text:String {
       switch self {
           case .RepeatIcon: return "repeat"
           case .Backward_end: return "backward.end"
           case .Pause_fill: return "pause.fill"
           case .Play_fill: return "play.fill"
           case .Forward_end: return "forward.end"
           case .Point_forward_to_Point_capsulepath: return "point.forward.to.point.capsulepath"
           case .Heart_fill: return "heart.fill"
           case .Arrowshape_down_fill: return "arrowshape.down.fill"
           case .Arrowshape_turn_up_forward_fill: return "arrowshape.turn.up.forward.fill"
           case .Music_note_list: return "music.note.list"
           case .Chevron_up: return "chevron.up"
           case .Arrow_backward: return "arrow.backward"
           case .Ellipsis: return "ellipsis"
        }
    }
 }
