//
//  ContentView.swift
//  FlowDemo
//
//  Created by chen on 2021/2/23.
//

import SwiftUI


/*
 Tutorial shows you how to use @State and @Binding
 */
struct ContentView: View {
    @State private var isShowing: Bool = false
    
    var body: some View {
        VStack {
            Text("State variable tutorial")
            Button("Click me to show a sheet.") {
                // will trigger ui refresh
                self.isShowing = true
            }
        }.sheet(isPresented: $isShowing) {
            SheetView(isPresented: $isShowing)
        }
    }
}


struct SheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button("Click me to dismiss myself") {
            isPresented = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
