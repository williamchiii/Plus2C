import SwiftUI
import SceneKit

//bridges SceneKit into SwiftUI
//UIViewRepresentable allows us to embed an SCNView inside SwiftUI
struct GlobeView: UIViewRepresentable {
    var isTopographic: Bool = false
    var showStars: Bool = true
    var transparentBg: Bool = false
    var movable: Bool = true
    //Functions
    
    //called once when view is created
    func makeUIView(context: Context) -> SCNView {
        //create SceneView Kit
        let view = SCNView()
        if !transparentBg{
            view.backgroundColor = .black
        }
        else {
            view.backgroundColor = .clear
        }
        
        //create a new empty scene
        let scene = SCNScene()
        view.scene = scene
        
        //Star field (simple image field)
        if isTopographic{
            scene.background.contents = UIColor(Color(red: 114/255, green: 157/255, blue: 219/255))
        } else{
            if showStars{
                scene.background.contents = UIImage(named: "stars")
            }
            
        }
        
        
        //Allow user interaction
        if movable{
            view.allowsCameraControl = true
        }
       
        view.defaultCameraController.interactionMode = .orbitTurntable
        view.defaultCameraController.inertiaEnabled = true
        
        //Camera Settings
        //Create the camera view
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        //move camera position slightly back
        cameraNode.position = SCNVector3(0,0,4)
        //add camera to the scene
        scene.rootNode.addChildNode(cameraNode)
        
        //Lighting Setup
        //create directional light
        let directional = SCNLight()
        directional.type = .directional
        directional.intensity = 900
        let directionalNode = SCNNode()
        directionalNode.light = directional
        //angle light slightly
        directionalNode.eulerAngles = SCNVector3(-0.4, 0.8, 0)
        scene.rootNode.addChildNode(directionalNode)
        //ambient lighting
        let ambient = SCNLight()
        ambient.type = .ambient
        ambient.intensity = 250
        let ambientNode = SCNNode()
        ambientNode.light = ambient
        scene.rootNode.addChildNode(ambientNode)
        
        //Globe geometry
        //Create a sphere geometry
        let sphere = SCNSphere(radius: 1.0)
        sphere.segmentCount = 144
        let material = SCNMaterial()
        material.lightingModel = .physicallyBased
        if isTopographic{
            //prints out console log if image doesnt exist
            if let earthTopo = UIImage(named: "earthTopography"){
                material.diffuse.contents = earthTopo
            } else{
                print("Error: earthTopography could NOT be loaded")
            }
            
        }
        else{
            if let earthImage = UIImage(named: "earthApril"){
                material.diffuse.contents = earthImage
            } else{
                print("Error: earthApril could NOT be loaded")
            }
            

        }
        sphere.firstMaterial = material
        //create globe node to hold the sphere
        let globeNode = SCNNode(geometry: sphere)
        scene.rootNode.addChildNode(globeNode)
        globeNode.eulerAngles = SCNVector3(0.15, -0.6, 0)
        
        //slow rotation
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat.pi * 2, z: 0, duration: 100)
        globeNode.runAction(.repeatForever(rotation))
        
        return view
    }
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
}
