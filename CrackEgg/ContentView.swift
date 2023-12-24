//
//  ContentView.swift
//  CrackEgg
//
//  Created by Paula Boyano Ivars on 24/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter: Int = 0
    @AppStorage("appStorageCounter") var appStorageCounter: Int = 0
    
    var body: some View {
        CounterView(counter: $counter, appStorageCounter: $appStorageCounter)
    }
}

struct CounterView: View {
    
    @Binding var counter: Int
    @Binding var appStorageCounter: Int
    
    var body: some View {
        VStack {
            Text("Counter \(counter)")
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
                .onTapGesture {
                    self.counter += 1
                    appStorageCounter = counter
                }
        }.onAppear {
            counter = appStorageCounter
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
