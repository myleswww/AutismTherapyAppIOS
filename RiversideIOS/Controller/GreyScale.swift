//
//  GreyScale.swift
//  RiversideIOS
//
//  Created by Nicole Selig on 10/11/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

//we will use greyscale images for the photobooth activity because the MLModel is trained with greyscale images
extension UIImage {
    var mono: UIImage {
        let context = CIContext(options: nil)
        let currentFilter = CIFilter(name: "CIPhotoEffectMono")!
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        let output = currentFilter.outputImage!
        let cgImage = context.createCGImage(output, from: output.extent)!
        let processedImage = UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        return processedImage
    }
}
