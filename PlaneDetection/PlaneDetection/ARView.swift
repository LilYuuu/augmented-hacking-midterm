//
//  ARView.swift
//  PlaneDetection
//
//  Created by Lily Yu on 10/24/23.
//

import SwiftUI
import ARKit
import RealityKit
import Combine

struct ARViewContainer: UIViewRepresentable {
    let viewModel: ViewModel
    
    func makeUIView(context: Context) -> SimpleARView {
        SimpleARView(frame: .zero, viewModel: viewModel)
        
//        let arView = ARView(frame: .zero)
//
//        // Create a cube model
//        let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
//        let material = SimpleMaterial(color: .gray, roughness: 0.15, isMetallic: true)
//        let model = ModelEntity(mesh: mesh, materials: [material])
//
//        // Create horizontal plane anchor for the content
//        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
//        anchor.children.append(model)
//
//        // Add the horizontal plane anchor to the scene
//        arView.scene.anchors.append(anchor)
//
//        return arView
        
    }
    
    func updateUIView(_ uiView: SimpleARView, context: Context) {}
    
}

class SimpleARView: ARView {
    var viewModel: ViewModel
    var arView: ARView { return self }
//    @Published var sceneView: ARSCNView!
    
    init(frame: CGRect, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
//        // Configure your AR session here, e.g., plane detection, tracking, etc.
//        let configuration = ARWorldTrackingConfiguration()
//        configuration.planeDetection = [.horizontal, .vertical]
//        sceneView.session.run(configuration)
//        
//        // Show debug UI to view performance metrics (e.g. frames per second).
//        sceneView.showsStatistics = true
        
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    
}
