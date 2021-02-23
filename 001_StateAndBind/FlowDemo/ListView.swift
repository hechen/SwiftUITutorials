//
//  ListView.swift
//  FlowDemo
//
//  Created by chen on 2021/2/23.
//

import SwiftUI

struct Row: Identifiable {
    var id: String
    var index: Int
}

extension Row: CustomStringConvertible {
    var description: String {
        return "\(index)"
    }
}

var data: [Row] = [
    Row(id: "0", index: 0),
    Row(id: "1", index: 1),
    Row(id: "2", index: 2),
    Row(id: "3", index: 3)
]

struct ListView: View {
    // Bind a data into this view
    // refresh view whenever data change
    @State var rows: [Row]
    var body: some View {
        NavigationView {
            List(rows) {
                NavigationLink($0.description,
                               destination: RowDetailView(row: $0))
            }
            .navigationBarTitle(Text("List View Tutorial"))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: NavigationRandomBarItem(presentedData: $rows))
        } // NavigationView
    }
}

struct RowDetailView: View {
    var row: Row
    
    var body: some View {
        VStack {
            Text(row.description)
        }
    }
}

struct NavigationRandomBarItem: View {
    @Binding var presentedData: [Row]
    
    var body: some View {
        Button("Random") {
            presentedData.shuffle()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(rows: data)
    }
}
