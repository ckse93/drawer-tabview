//
//  AppState.swift
//  drawerTabView
//
//  Created by Zack Jung on 1/18/22.
//

import Foundation
import Combine

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var selectedTab = 0
    
    enum Tab: Int, Equatable {
        case today = 0
        case chat = 1
        case learning = 2
        case me = 3
    }
}

func ==(lhs: Int, rhs: AppState.Tab) -> Bool {
    switch(lhs, rhs) {
    case (0, .today): return true
    case(1, .chat): return true
    case(2, .learning): return true
    case(3, .me): return true
    default: return false
    }
}
