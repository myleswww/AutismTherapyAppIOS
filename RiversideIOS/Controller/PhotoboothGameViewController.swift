//
//  PhotoboothGameViewController.swift
//  RiversideIOS
//
//  Created by Nicole Selig on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit
import CoreML
import Vision


class PhotoboothGameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var confidenceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    let imagePicker = UIImagePickerController()
    
    //finds the bounding boxes of faces in the image
    lazy var faceDetectionRequest = VNDetectFaceRectanglesRequest(completionHandler: self.onFacesDetected)
    let faceDetectionRequestHandler = VNSequenceRequestHandler()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        //implements camera functionality
        imagePicker.sourceType = .camera
        //disables editing by user
        imagePicker.allowsEditing = false
        
    }
    
    //MARK: delegate: did Finish Picking Media With Info
    //this built in delegate function comes from the UIImagePickerControllerDelegate Class. tells the delegate that the user has picked an image, and we want to do something with it.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image picked. Setting image into the view...")
        //get a hold of the image the user has selected
        // 'as?' is called optional binding
        //if the userPicked image can be cast as a UIImage datatype, then set in the imageView
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
            
            //convert the image to greyscale
            let monoImage = userPickedImage.mono
            
            //convert image to a core image image, which will allow us to use Vision and CoreML frameworks
            //'guard' statements are used as error handling..kind of like try and catches
            guard let ciImage = CIImage(image: monoImage) else {
                fatalError("could not convert image to a CI Image")
            }
            
            detectFaces(on: ciImage)
            
            classifyEmotion(image: ciImage)
        }
        
        //dismiss the image picker and go back to the view controller
        imagePicker.dismiss(animated: true, completion: nil)
       
    }
    
    
    
    
    //MARK: cropImage
    func cropImage(image: CIImage, rect: CGRect) -> CIImage {
            let croppedImage = image.cropped(to: rect)
            return croppedImage
        }
    
    
    //MARK: onFacesDetected
        //completion handler. prints the result to the console upon face detection
        func onFacesDetected(request: VNRequest, error: Error?) {
            guard let faces = request.results as? [VNFaceObservation] else {
                return
            }
            
            for face in faces {
                print("Found face at \(face.boundingBox)")
                
                let width = face.boundingBox.width
                let height = face.boundingBox.height
                let x = face.boundingBox.origin.x
                let y = (1 - face.boundingBox.origin.y) - height
                
                let rect = CGRect(x: x, y: y, width: width, height: height)
            }
        }
    
    
    
    //MARK: detectFaces
     func detectFaces(on image: CIImage){
         //this handler performs different operations on a single image
         let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
         
         //perform the request
         DispatchQueue.global(qos: .userInitiated).async {
             do{
                 try handler.perform([self.faceDetectionRequest])
             }
             catch {
                 print(error)
             }
         }
     }
    
    
    //MARK: classifyEmotion
    func classifyEmotion(image: CIImage) {
        
        //create a new object of the emotion model
        //'try?' -- attempt to perform an operation. if it succeeds, it will be wrapped as an option, if not, then the result will be nil
        //the guard handles the nil and sends an error message.
        //VNCoreML Model is part of the Vision framework, and will allow us to analyze images.
        let config = MLModelConfiguration()
            guard let model = try? VNCoreMLModel(for: CNNEmotions(configuration: config).model) else {
            fatalError("Loading CoreML model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("model failed to process image")
            }
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.minimumIntegerDigits = 1
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 1
            
            //print(results)
            self.resultsLabel.text = results.first?.identifier ?? "null"
            self.confidenceLabel.text = formatter.string(for: results.first?.confidence) ?? "null"
            print(results.first?.identifier ?? "null")
            print(formatter.string(for: results.first?.confidence) ?? "null")
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do{
        try handler.perform([request])
        }
        catch {
            print(error)
        }
        
        
    }
    
    //MARK: Camera Button Pressed
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        print("Camera button pressed.")
        present(imagePicker, animated: true, completion: nil)
    }
    

}
