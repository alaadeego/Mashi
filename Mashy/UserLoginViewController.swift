//
//  UserLoginViewController.swift
//  Mashy
//
//  Created by Amal Khaled on 11/4/17.
//  Copyright © 2017 amany. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class UserLoginViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource
,GIDSignInUIDelegate ,GIDSignInDelegate{
    
    @IBOutlet var emailEditText: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet var passEditText: SkyFloatingLabelTextFieldWithIcon!
    
    var mediaName:Array = [String]()
    var mediaPhoto:Array = [UIImage]()
    var iconClick : Bool!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediaName = ["جوجل".localized(),
                    "فيسبوك".localized(),
                     "تويتر".localized()]
        mediaPhoto = [#imageLiteral(resourceName: "google"),#imageLiteral(resourceName: "facebook"),#imageLiteral(resourceName: "twitter")]
        iconClick = true

        emailEditText.isLTRLanguage = false
        passEditText.isLTRLanguage = false

        emailEditText.iconText = "\u{f072}"
        passEditText.iconText = "\u{f023}"

        //Google Login
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        if configureError != nil {
            print("we have error \(configureError)")
        }
        GIDSignIn.sharedInstance().delegate = self
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signOut()
        
        GIDSignIn.sharedInstance().signInSilently()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! mediaLoginCell
        cell.mediaName.text! = mediaName[indexPath.row]
        cell.mediaImage.image = mediaPhoto[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){

        }
        else if (indexPath.row == 1){
            
        }
        else if (indexPath.row == 2){
            
        }
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            
            //            UserController.currentActiveUser.FName = user.profile.givenName
            //            UserController.currentActiveUser.LName = user.profile.familyName
            //            UserController.currentActiveUser.pass = user.userID
            //            UserController.currentActiveUser.email = user.profile.email
            //            UserController.currentActiveUser.loginType = "G"
            //            UserController.usercontroller.LoginMedia("G", loginViewController: self)
            //
            
            
        } else {
            
            print("\(error.localizedDescription)")
        }
    }
    
    
    func sign(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // LogOut
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        if validation() {
            AppDelegate.currentUser.email = emailEditText.text!
            AppDelegate.currentUser.pass = passEditText.text!
            Services.services.login(uiViewController: self)
        }
    }
    func validation()->Bool{
        var valid = true
        if emailEditText.text!.count == 0{
            emailEditText.errorMessage = "ادخل البريد الالكتروني الصحيح".localized()
            valid = false
        }
        else {
            emailEditText.errorMessage = ""
            valid = true

        }
        if passEditText.text!.count == 0{
            passEditText.errorMessage = "ادخل كلمه المرور".localized()
            valid = false
        }
        else {
            passEditText.errorMessage = ""
            valid = true
            
        }
        
        return valid
    }
    
    
    @IBAction func showPassword(_ sender: Any) {
        if(iconClick == true) {
            passEditText.isSecureTextEntry = false
            iconClick = false
        } else {
            passEditText.isSecureTextEntry = true
            iconClick = true
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
