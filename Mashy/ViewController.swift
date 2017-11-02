//
//  ViewController.swift
//  Mashy
//
//  Created by mac on 10/26/17.
//  Copyright © 2017 amany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        // amanyEdit
        // set menuicone

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"menu-icon"), style: .plain, target: self, action: #selector(ViewController().open_side_menu))
        navigationItem.rightBarButtonItem?.tintColor=UIColor.white

        if revealViewController() != nil {
            revealViewController().rightViewRevealWidth = 230
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }



        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden =  true
        navigationItem.title = ""
        //Change status bar color
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = UIColor(rgb:0xf57c00)
    }


    func open_side_menu(){

        revealViewController().rightRevealToggle(animated: true)


    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
