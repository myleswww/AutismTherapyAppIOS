//
//  Contrast.swift
//  RiversideIOS
//
//  Created by Nicole Selig on 11/30/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

//we will use highly contrasted images for the photobooth activity because the MLModel is trained with highly contrasted images
extension UIImage {
    var increaseContrast: UIImage {
        let context = CIContext(options: nil)
        let parameters = ["inputContrast": NSNumber(value:1)]
        let currentFilter = CIFilter(name: "CIColorControls", parameters: parameters)!
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        let output = currentFilter.outputImage!
        let cgImage = context.createCGImage(output, from: output.extent)!
        let processedImage = UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        return processedImage
    }
}
