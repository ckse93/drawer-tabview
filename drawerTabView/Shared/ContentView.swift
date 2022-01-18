//
//  ContentView.swift
//  Shared
//
//  Created by Zack Jung on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    let hiddenHeight = UIScreen.main.bounds.size.height - 250
    let showHeight: CGFloat = 170
    @State var size: CGFloat = UIScreen.main.bounds.size.height - 250
    
    var body: some View {
        ZStack{
            Color.orange
            
            Swipe()
                .padding(.top)
                .offset(y: self.size)
                .gesture(DragGesture()
                            .onChanged({ value in
                    if value.translation.height > 0 {
                        self.size = value.translation.height
                    } else {
                        let temp = hiddenHeight
                        self.size = temp + value.translation.height
                    }
                })
                            .onEnded({ value in
                    if value.translation.height > 0 {
                        if value.translation.height > 200 {
                            self.size = hiddenHeight
                        } else {
                            self.size = showHeight
                        }
                    } else {
                        if value.translation.height < -200 {
                            self.size = showHeight
                        } else {
                            self.size = hiddenHeight
                        }
                    }
                }))
                .animation(.spring(), value: true)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

struct Swipe: View {
    var body: some View {
        VStack {
            
            /// for pushing view up
            VStack {
                Text("visible area")
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
