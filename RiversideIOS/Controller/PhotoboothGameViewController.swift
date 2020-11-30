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
    
    var height: CGFloat = 0.0
    var width: CGFloat = 0.0
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var boundingBox: CGRect!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateImagePicker()
        
    }
    
    func updateImagePicker(){
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
            
            //let contrastedImage = monoImage.increaseContrast
        
            
            let centeredImage = faceCenterImage(monoImage)
            
//            let size = CGSize(width: 48, height: 48)
//            let finishedImage = resizeImage(image: centeredImage, targetSize: size)
            
            imageView.image = centeredImage
            
            
            //imageView.image = monoImage
            
            //convert image to a core image image, which will allow us to use Vision and CoreML frameworks
            //'guard' statements are used as error handling..kind of like try and catches
            guard let ciImage = CIImage(image: centeredImage) else {
                fatalError("could not convert image to a CI Image")
            }
            

//            detectFaces(on: ciImage)
//
//            print(height)
//            print(width)
//            print(x)
//            print(y)
//
//
//
            classifyEmotion(image: ciImage)
            updateImagePicker()
        }
        
        //dismiss the image picker and go back to the view controller
        imagePicker.dismiss(animated: true, completion: nil)
       
    }
    
    
    
    //MARK: onFacesDetected
        //completion handler. prints the result to the console upon face detection
        func onFacesDetected(request: VNRequest, error: Error?) {
            guard let faces = request.results as? [VNFaceObservation] else {
                return
            }
            
            
            for face in faces {
                print("Found face at \(face.boundingBox)")
                boundingBox = face.boundingBox
            }
        }
    
    
    //MARK: detectFaces
     func detectFaces(on image: CIImage){
         //this handler performs different operations on a single image
         let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
         
         //perform the request
         DispatchQueue.global(qos: .userInitiated).sync {
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
            
            print(results)
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
    
    
    //MARK: Face Centering
    func faceCenterImage(_ image: UIImage) -> UIImage {
  
        guard let uncroppedCgImage = image.cgImage else {
            imageView.image = image
            return image
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            uncroppedCgImage.faceCrop { [weak self] result in
                switch result {
                case.success(let cgImage):
                    DispatchQueue.main.async {
                        self?.imageView.image = UIImage(cgImage: cgImage, scale: 0.0, orientation: .right)
                    }
                case.notFound, .failure( _):
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
        }
            
    }
        return image
    }
    
    //MARK: IMAGE RESIZE
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
       let size = image.size

       let widthRatio  = targetSize.width  / size.width
       let heightRatio = targetSize.height / size.height

       // Figure out what our orientation is, and use that to form the rectangle
       var newSize: CGSize
       if(widthRatio > heightRatio) {
           newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
       } else {
           newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
       }

       // This is the rect that we've calculated out and this is what is actually used below
       let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

       // Actually do the resizing to the rect using the ImageContext stuff
       UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
       image.draw(in: rect)
       let newImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()

       return newImage!
   }
    
   
}
