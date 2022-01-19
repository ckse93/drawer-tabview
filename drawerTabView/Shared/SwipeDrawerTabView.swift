//
//  SwipeDrawerTabView.swift
//  drawerTabView
//
//  Created by Zack Jung on 1/19/22.
//

import SwiftUI

struct SwipeDrawerTabView: View {
    let showHide: Binding<Bool>
    var body: some View {
        VStack {
            
            /// for pushing view up
            HStack {
                Button {
                    AppState.shared.selectedTab = 0
                } label: {
                    Text("MAIN")
                        .frame(height: 30)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(5)
                }
                
                Button {
                    AppState.shared.selectedTab = 1
                } label: {
                    Text("SEC")
                        .frame(height: 30)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(5)
                }

                
                Button {
                    showHide.wrappedValue.toggle()
                } label: {
                    Text("visible area")
                }
                .background(Color.orange)
                .padding()
                .cornerRadius(15)
                
                Button {
                    AppState.shared.selectedTab = 2
                } label: {
                    Text("TRD")
                        .frame(height: 30)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(5)
                }
                
                Button {
                    AppState.shared.selectedTab = 3
                } label: {
                    Text("FOTH")
                        .frame(height: 30)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(5)
                }

            }
            .border(.blue)
            
            /// the content view
            VStack {
                HStack{
                    Text("left")
                    
                    Spacer()
                    
                    Text("right")
                }
                .border(.red)
                
                Spacer()
                
                Text("btm")
            }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
 
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}
