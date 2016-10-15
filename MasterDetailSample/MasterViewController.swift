//
//  MasterViewController.swift
//  MasterDetailSample
//
//  Created by Jörg Tischer on 14.10.16.
//  Copyright © 2016 Jörg Tischer. All rights reserved.
//

import UIKit

protocol MonsterSelectionDelegate: class {
    func monsterSelected(newMonster: Monster)
}

class MasterViewController: UITableViewController {
    
    weak var delegate: MonsterSelectionDelegate?

    var monsters = [Monster]()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.monsters.append(Monster(name: "Cat-Bot", description: "MEE-OW",
                                     iconName: "meetcatbot.png", weapon: Weapon.Sword))
        self.monsters.append(Monster(name: "Dog-Bot", description: "BOW-WOW",
                                     iconName: "meetdogbot.png", weapon: Weapon.Blowgun))
        self.monsters.append(Monster(name: "Explode-Bot", description: "BOOM!",
                                     iconName: "meetexplodebot.png", weapon: Weapon.Smoke))
        self.monsters.append(Monster(name: "Fire-Bot", description: "Will Make You Stamed",
                                     iconName: "meetfirebot.png", weapon: Weapon.NinjaStar))
        self.monsters.append(Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
                                     iconName: "meeticebot.png", weapon: Weapon.Fire))
        self.monsters.append(Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
                                     iconName: "meetminitomatobot.png", weapon: Weapon.NinjaStar))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.monsters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        
        let monster = monsters[indexPath.row]
        cell.textLabel?.text = monster.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonster = self.monsters[indexPath.row]
        
        var navigationController: UINavigationController!
        if false {
            let defaultStoryboard = UIStoryboard(name: "Default", bundle: nil)
            let defaultViewConroller = defaultStoryboard.instantiateInitialViewController()
            navigationController = UINavigationController(rootViewController:defaultViewConroller!)
        } else {
            let detailStoryboard = UIStoryboard(name: "Detail", bundle: nil)
            navigationController = detailStoryboard.instantiateInitialViewController() as! UINavigationController
            let detailViewController = navigationController.topViewController as! DetailViewController
            self.delegate = detailViewController
        }

        self.delegate?.monsterSelected(newMonster: selectedMonster)
        splitViewController?.showDetailViewController(navigationController!, sender: nil)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
