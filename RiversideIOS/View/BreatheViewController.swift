//
//  BreatheViewController.swift
//  RiversideIOS
//
//  Created by Mom on 11/10/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import SwiftUI
import UIKit

class BreatheViewController: UIHostingController<BreatheView>{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: BreatheView())
    }
}
