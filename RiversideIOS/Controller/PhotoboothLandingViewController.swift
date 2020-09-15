//
//  PhotoboothViewController.swift
//  RiversideIOS
//
//  Created by Mom on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

class PhotoboothLandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func menuButtonPressed(_ sender: UIButton) {
        print("menu button pressed")
        
        performSegue(withIdentifier: "PhotoboothToMenu", sender: self)
    }
    
    
    @IBAction func letsPlayButtonPressed(_ sender: UIButton) {
        print("Lets play button pressed")
        performSegue(withIdentifier: "PhotoboothLandingToPlay", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
