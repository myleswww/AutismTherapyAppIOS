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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressview.transform = progressview.transform.scaledBy(x: 1, y: 5
            
        )
        // Do any additional setup after loading the view.
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
