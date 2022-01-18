//
//  ContentView.swift
//  Shared
//
//  Created by Zack Jung on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    let hiddenHeight = UIScreen.main.bounds.size.height - 280
    let showHeight: CGFloat = 170
    let swipeDistance: CGFloat = 100
    @State var size: CGFloat = UIScreen.main.bounds.size.height - 280
    @State var showDrawer: Bool = false
    
    var body: some View {
        ZStack{
            TabView(selection: $appState.selectedTab) {
                NavigationView {
                    ScrollView {
                        ZStack{
                            Color.orange
                            Text("Today View")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
                .tabItem {
                    Text("T0day")
                }
                .tag(0)  // need tag for each tabBar item
                
                NavigationView {
                    ScrollView {
                        ZStack{
                            Color.blue
                            Text("Chat View")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
                .tabItem {
                    Text("Chat")
                }
                .tag(1)
                
                NavigationView {
                    ScrollView {
                        ZStack{
                            Color.green
                            Text("Learning View")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
                .tabItem {
                    Text("Learning")
                }
                .tag(2)
                
                NavigationView {
                    ScrollView {
                        ZStack{
                            Color.teal
                            Text("Me View")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
                .tabItem {
                    Text("Me")
                }
                .tag(3)
                
            }
            
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
            HStack {
                Button {
                    AppState.shared.selectedTab = 0
                } label: {
                    Text("TODAY")
                        .frame(height: 30)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(5)
                }
                
                Button {
                    AppState.shared.selectedTab = 1
                } label: {
                    Text("TODAY")
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
                    Text("TODAY")
                        .frame(height: 30)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(5)
                }
                
                Button {
                    AppState.shared.selectedTab = 3
                } label: {
                    Text("TODAY")
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
