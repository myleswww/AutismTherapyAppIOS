//
//  QuizViewController.swift
//  RiversideIOS
//
//  Created by Mom on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

class QuizLandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func menuPressed(_ sender: UIButton) {
        print("Menu Button Pressed")
        
        performSegue(withIdentifier: "QuizToMenu", sender: self)
        
    }
    
    @IBAction func letsPlayButtonPressed(_ sender: UIButton) {
        print("lets play button pressed")
        performSegue(withIdentifier: "QLandingToPlay", sender: self)
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
