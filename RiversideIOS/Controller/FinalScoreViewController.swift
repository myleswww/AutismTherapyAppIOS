//
//  FinalScoreViewController.swift
//  RiversideIOS
//
//  Created by Mom on 10/1/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

class FinalScoreViewController: UIViewController {

    //MARK: Outlets and Buttons
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var mainMenuButton: UIButton!
    
    
    //MARK: Class Variables
    var finalScore: String = "";
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel?.text = finalScore
        
    }
    
    //MARK: Button Pressed
    //you can also link multiple buttons to one function, as done here.
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        //control flow for buttons
        if sender.titleLabel == playAgainButton.titleLabel {
            performSegue(withIdentifier: "ScoreToQuizLanding", sender: self)
            
        }
        else{
            
            performSegue(withIdentifier: "ScoreToMainMenu", sender: self)
        }
    }
    
}
