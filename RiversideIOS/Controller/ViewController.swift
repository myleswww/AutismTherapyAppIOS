//
//  ViewController.swift
//  RiversideIOS
//
//  Created by Mom on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

//MARK: View Controller Classes
//this is a Cocoa Touch Class. When you make a new view controller, you must also make its
//corresponding Cocoa Touch Class. This is where you can programmatically unite the UI with the
//code

class ViewController: UIViewController {
    
    //MARK: VIEW DID LOAD
    //this is where to put all the things you want to happen at page loading
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: BUTTON ACTIONS
    
    //quiz button pressed
    @IBAction func quizButtonPressed(_ sender: UIButton) {
        print("quiz button pressed")
        
        //segue into the quiz view controller
        self.performSegue(withIdentifier: "MainToQuiz", sender: self)
    }
    
    //photobooth button pressed
    @IBAction func photoboothButtonPressed(_ sender: UIButton) {
        print("photobooth button pressed")
        
        //segue into the photobooth view controller
        self.performSegue(withIdentifier: "MainToPhotobooth", sender: self)
    }
    
}

