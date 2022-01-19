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
    
    enum SelectedTab: Int, Equatable {
        case main = 0
        case second = 1
        case third = 2
        case forth = 3
    }
}

func ==(lhs: Int, rhs: AppState.SelectedTab) -> Bool {
    switch(lhs, rhs) {
    case (0, .main): return true
    case(1, .second): return true
    case(2, .third): return true
    case(3, .forth): return true
    default: return false
    }
}
