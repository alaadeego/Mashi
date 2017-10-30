//
//  RightMenuViewController.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 06/03/15.
//  Copyright (c) 2015 Sebastian Andersen. All rights reserved.
//

import Foundation
import UIKit

class RightMenuViewController: UIViewController {
    
    @IBOutlet weak var tablemenu: UITableView!
    var Titles_menu:[String]?
    var Image_menu:[String]?

    override func viewWillAppear(_ animated: Bool) {
        Titles_menu = ["test"]
        tablemenu.delegate=self
        tablemenu.dataSource=self
        tablemenu.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
    }
    override func viewDidLoad() {

        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector:#selector(RightMenuViewController.UpdateMenuData) , name: NSNotification.Name(rawValue: "ReloadMenuData"), object: nil)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK : TableViewDataSource & Delegate Methods

extension RightMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Titles_menu!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return 45

    }


    func UpdateMenuData(){
        self.tablemenu.reloadData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell:menuCell  = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! menuCell
        cell.menu_title.text = Titles_menu?[indexPath.row]
        return cell
            
            

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "categoriesNav")
//            let rvc:SWRevealViewController = self.revealViewController() as SWRevealViewController
//            rvc.pushFrontViewController(vc, animated: true)
//            

            break

        default:
            break
        }
        
        
    }

}

