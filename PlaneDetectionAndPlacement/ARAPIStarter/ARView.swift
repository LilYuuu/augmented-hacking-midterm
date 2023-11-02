//
//  ARView.swift
//  ARAPIStarter
//
//  Created by Nien Lam on 10/19/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

// Tutorial for raycasting: https://coledennis.medium.com/tutorial-tap-to-place-ar-content-using-realitykit-and-swiftui-e2579d93708d

import SwiftUI
import ARKit
import RealityKit
import Combine

struct ARViewContainer: UIViewRepresentable {
    let viewModel: ViewModel
    
    func makeUIView(context: Context) -> SimpleARView {
        SimpleARView(frame: .zero, viewModel: viewModel)
    }
    
    func updateUIView(_ arView: SimpleARView, context: Context) { }
}

class SimpleARView: ARView {
    var viewModel: ViewModel
    var arView: ARView { return self }
    var subscriptions = Set<AnyCancellable>()

    var planeAnchor: AnchorEntity?

//    var sphere: SphereEntity!
    
    let planeModel = try! Entity.loadModel(named: "plane.usda")

    
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
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        setupScene()
//        setupEntities()
//        setupSubscriptions()
        placeMessage()
    }
        
    func setupScene() {
        // Setup world tracking and plane detection.
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing = .automatic
        arView.renderOptions = [.disableDepthOfField, .disableMotionBlur]
        arView.session.run(configuration)
    }

    func setupSubscriptions() {
        // Process UI signals.
        viewModel.uiSignal.sink { [weak self] in
            self?.processUISignal($0)
        }
        .store(in: &subscriptions)

        // Observe slider value.
//        viewModel.$sliderValue.sink { [weak self] value in
//            guard let self else { return }
//            
//            let scale = value * 2
//            sphere.scale = [scale, scale, scale]
//        }
//        .store(in: &subscriptions)
    }
    
    func processUISignal(_ signal: ViewModel.UISignal) {
        switch signal {
        case .screenTapped(let location):
//            placeMessage(at: location)
            return
        case .reset:
            resetScene()
        }
    }


    // Define entities here.
    func setupEntities() {
//        sphere = SphereEntity(name: "sphere", radius: 0.1, imageName: "checker.png")
    }
    

    // Reset plane anchor and position entities.
    func resetScene() {
        // Reset plane anchor. //
        planeAnchor?.removeFromParent()
        planeAnchor = nil
        planeAnchor = AnchorEntity(plane: [.horizontal])
        arView.scene.addAnchor(planeAnchor!)
        
        // Position and add sphere to scene.
//        sphere.position.x = 0
//        sphere.position.y = 0
//        sphere.position.z = 0
//        planeAnchor?.addChild(sphere)
    }
    
    
    // Detect the plane and place when tapping
    func placeMessage() {
        // Set up plane anchor
        // Using wall for testing
        let planeAnchor = AnchorEntity(.plane([.horizontal],
                                              classification: [.floor, .ceiling],
                                              minimumBounds: [1.0, 1.0]))
        
        // Placement
        // MessageView
        let testMessage = Message(sender: "Lily", text: "testing testing", location: "wall", time: "2023-10-25 15:22:42")
        let renderer = ImageRenderer(content: MessageView(message: testMessage))
        renderer.scale = viewModel.displayScale
        
        if let uiImage = renderer.uiImage {
            
            // for testing: display the message view in content view
//            print("SETTING IMAGE")
//            viewModel.testImage = uiImage
            
            // Create a texture using the CGImage
            let texture = try! TextureResource.generate(from: uiImage.cgImage!, options: .init(semantic: .normal))
            
            // Create a material
            var material = SimpleMaterial()
            material.color = .init(tint: .white.withAlphaComponent(0.999),
                                   texture: .init(texture))
            
            // Create new plane entity
            let entity = planeModel.clone(recursive: false)
            
            // Adjust the rotation on x-axis
            let rotation = simd_quatf(angle: .pi/2, axis: [-1, 0, 0])
            entity.transform.rotation = rotation

            // Set plane entity with material
            entity.model?.materials = [material]
            
            // Add plane entity to anchor
            planeAnchor.addChild(entity)
            
        }
        
        print("------")
        print("placed an entity")
        print("------")
        
        arView.scene.addAnchor(planeAnchor)

    }
}
