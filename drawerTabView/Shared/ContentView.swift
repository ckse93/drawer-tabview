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
    let swipeDistance: CGFloat = 100
    @State var size: CGFloat = UIScreen.main.bounds.size.height - 250
    @State var showDrawer: Bool = false
    
    var body: some View {
        ZStack{
            Color.orange
            
            Swipe(showHide: $showDrawer)
                .padding(.top)
                .offset(y: self.size)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ val in
                    if val.translation.height < self.swipeDistance {
                        // up
                        self.showDrawer = true
                    }
                    
                    if val.translation.height > self.swipeDistance {
                        // down
                        self.showDrawer = false
                    }
                })
                
                )
                .animation(.spring(), value: true)
        }
        .ignoresSafeArea()
        .onChange(of: showDrawer) { newValue in
            withAnimation {
                self.size = newValue ? showHeight : hiddenHeight
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

struct Swipe: View {
    let showHide: Binding<Bool>
    var body: some View {
        VStack {
            
            /// for pushing view up
            VStack {
                Button {
                    showHide.wrappedValue.toggle()
                } label: {
                    Text("visible area")
                }
                .background(Color.orange)
                .padding()
                .cornerRadius(15)

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
