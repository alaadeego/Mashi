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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

