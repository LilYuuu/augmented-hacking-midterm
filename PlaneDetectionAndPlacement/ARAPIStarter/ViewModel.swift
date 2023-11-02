//
//  ViewModel.swift
//  APIStarter
//
//  Created by Nien Lam on 10/19/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//@MainActor
class ViewModel: ObservableObject {
    
    @Environment(\.displayScale) var displayScale
    
    @Published var testImage: UIImage?

    
    // For handling different button presses.
    enum UISignal {
        case screenTapped(location: CGPoint)
        case reset
    }
    let uiSignal = PassthroughSubject<UISignal, Never>()
    
    
    init() {
        
    }
}

struct Message: Identifiable {
    var id = UUID()
    var sender: String
    var text: String
    var location: String
    var time: String
}

struct MessageView: View {
    let message: Message

    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("✉️ \(message.sender)")
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
//                Text(message.time)
//                    .font(.subheadline)
//                Text("Location: \(message.location)")
                
            }
            .padding(4)
//            Spacer()
            Text(message.text)
                .foregroundStyle(.white)
                .padding(4)
        }
        .padding(30)
        .frame(width: 300, height: 200)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.4)).shadow(radius: 20))
            
    }
}
