//
//  QuizGameViewController.swift
//  RiversideIOS
//
//  Created by Mom on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

class QuizGameViewController: UIViewController {

    @IBOutlet weak var progressview: UIProgressView!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var questionView: UIImageView!
    
    //outlets for buttons
 
    @IBOutlet weak var option1: UIButton!
    
    @IBOutlet weak var option2: UIButton!
    
    @IBOutlet weak var option3: UIButton!
    
    @IBOutlet weak var option4: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressview.transform = progressview.transform.scaledBy(x: 1, y: 5
            
        )
        // Do any additional setup after loading the view.
    }
    
    //all buttons are referenced to this function
    //to reference any button, open up the story board, click on the assistant button, and control-click and drag the button into the code
    @IBAction func answerPressed(_ sender: UIButton) {
        
        //control flow for buttons
        switch sender {
            case option1:
                print("option1")
                break
            case option2:
                print("option2")
                break
            case option3:
                print("option3")
                break
            case option4:
                print("option4")
                break
            default:
                break
        }
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
