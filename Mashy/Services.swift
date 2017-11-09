//
//  Services.swift
//  Mashy
//
//  Created by Amal Khaled on 11/4/17.
//  Copyright © 2017 amany. All rights reserved.
//

import Foundation
import Alamofire


class Services{
    static  let services = Services()
    func checkEmail(uiViewController : UIViewController){
        
        
        let link = Constants.CHECK_EMAIL + "?Email=" + AppDelegate.currentUser.email
        print (link)
        Alamofire.request(link, method: .get ).responseJSON { response in
            print(response.result.value)

            if let JSON = response.result.value  as? NSDictionary{
                let check = JSON["result"] as! String
                
                if (check == "not found"){
                    let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main" , bundle:nil)
                    let desController = mainStoryboard.instantiateViewController(withIdentifier: "cusu") as! CompleteUserSignUpViewController
                    let newFrontViewController = UINavigationController.init(rootViewController: desController)
                    uiViewController.present(newFrontViewController, animated: true, completion: nil)
                }
                else {
                    uiViewController.view.makeToast(NSLocalizedString("هذا الايميل موجود مسبقا", comment: ""))

                }
//                uiViewController.view.makeToast(NSLocalizedString("تم", comment: ""))


            }
            else{
                uiViewController.view.makeToast("لا يوجد انترنت".localized())

//                self.CreateDialog(uiViewController: uiViewController)



            }

        }
    }
    
    func SIGNUP(uiViewController : UIViewController){
        let link = Constants.SIGN_UP + "?Email=" + AppDelegate.currentUser.email + "&Name=" +
            "" + "&Password=" + AppDelegate.currentUser.pass + "&Phone=" + ""
        print (link)
        Alamofire.request(link, method: .get ).responseJSON { response in
            print(response.result.value)
            
            if let JSON = response.result.value  as? NSDictionary{
                let check = JSON["Result"] as! String
                
                if (check == "successfully"){
                    let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main" , bundle:nil)
                    let desController = mainStoryboard.instantiateViewController(withIdentifier: "signupfinished") as! FinshSignUpViewController
                    let newFrontViewController = UINavigationController.init(rootViewController: desController)
                    uiViewController.present(newFrontViewController, animated: true, completion: nil)
                }
                else {
                    uiViewController.view.makeToast("هذا الايميل موجود مسبقا".localized())
                    let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main" , bundle:nil)
                    let desController = mainStoryboard.instantiateViewController(withIdentifier: "user_email") as! UserEmailViewController
                    let newFrontViewController = UINavigationController.init(rootViewController: desController)
                    uiViewController.present(newFrontViewController, animated: true, completion: nil)
                    
                }
                
                
            }
            else{
                uiViewController.view.makeToast("لا يوجد انترنت".localized())
                
            }
            
        }
    }
    
    func login(uiViewController : UIViewController){
        let link = Constants.LOGIN_IN + "?Email=" + AppDelegate.currentUser.email +  "&Pass=" + AppDelegate.currentUser.pass
        print (link)
        Alamofire.request(link, method: .get ).responseJSON { response in
            print(response.result.value)
            
            if let JSON = response.result.value  as? NSDictionary{
                if let check = JSON["result"] as? String {
                      uiViewController.view.makeToast("البريد الالكتروني او كلمه المرور غير صحيحه".localized())
                
                }
                else if let check = JSON["result"] as? NSDictionary {
                    AppDelegate.currentUser.name = check["Name"] as! String
                    AppDelegate.currentUser.phone = check["Phone"] as! String
                    
                    //go to sceond map view
                   uiViewController.performSegue(withIdentifier: "map", sender: uiViewController)
                    //swreveal
                }
                

                
                
            }
            else{
                uiViewController.view.makeToast(("لا يوجد انترنت").localized())
                
            }
            
        }
    }
}
