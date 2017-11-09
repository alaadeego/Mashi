//
//  DriverEmailViewController.swift
//  Mashy
//
//  Created by Amal Khaled on 11/8/17.
//  Copyright © 2017 amany. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class DriverEmailViewController: UIViewController {

    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var emailEditText: SkyFloatingLabelTextFieldWithIcon!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailEditText.isLTRLanguage = false
        
        emailEditText.iconText = "\u{f0e0}"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func nextButtonAction(_ sender: Any) {
        if (emailEditText.text!.count != 0){
            emailEditText.errorMessage = ""
            AppDelegate.currentDriver.email = emailEditText.text!
            performSegue(withIdentifier: "driverEmail", sender: self)
            
        }
        else {
            emailEditText.errorMessage = "ادخل العنوان البريدي"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
