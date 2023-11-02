//
//  ContentView.swift
//  ARAPIStarter
//
//  Created by Nien Lam on 10/19/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            // AR View.
            ARViewContainer(viewModel: viewModel)

            // Reset button.
            Button {
                viewModel.uiSignal.send(.reset)
            } label: {
                Label("Reset", systemImage: "gobackward")
                    .font(.system(.title))
                    .foregroundColor(.white)
                    .labelStyle(IconOnlyLabelStyle())
                    .frame(width: 44, height: 44)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()

            // for testing: check the message view
//            if let image = viewModel.testImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .frame(width: 300, height: 200)
//            }
            
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
