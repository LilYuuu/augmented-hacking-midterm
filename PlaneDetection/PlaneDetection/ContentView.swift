//
//  ContentView.swift
//  PlaneDetection
//
//  Created by Lily Yu on 10/24/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            ARViewContainer(viewModel: viewModel).edgesIgnoringSafeArea(.all)
        }
        
    }
}



#Preview {
    ContentView(viewModel: ViewModel())
}
