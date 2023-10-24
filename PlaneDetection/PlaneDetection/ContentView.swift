//
//  ContentView.swift
//  PlaneDetection
//
//  Created by Lily Yu on 10/24/23.
//

import SwiftUI
import RealityKit
import SceneKit

struct ContentView : View {
    @State var viewModel: ViewModel
    @State var arSession: ARSessionManager
    
    var body: some View {
        ZStack {
            ARViewContainer(viewModel: viewModel, arSession: arSession).edgesIgnoringSafeArea(.all)
        }
        
    }
}



//#Preview {
//    ContentView(viewModel: ViewModel(), arSession: <#T##ARSessionManager#>)
//}
