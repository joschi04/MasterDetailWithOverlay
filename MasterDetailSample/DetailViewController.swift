//
//  DetailViewController.swift
//  MasterDetailSample
//
//  Created by Jörg Tischer on 14.10.16.
//  Copyright © 2016 Jörg Tischer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DonePressed(_ sender: AnyObject) {
        
        (UIApplication.shared.delegate as! AppDelegate).showOverlayAsDialog()
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weaponImageView: UIImageView!
    
    var monster: Monster! {
        didSet (newMonster) {
            self.refreshUI()
        }
    }
    
    func refreshUI() {
        nameLabel?.text = monster.name
        descriptionLabel?.text = monster.description
        iconImageView?.image = UIImage(named: monster.iconName)
        weaponImageView?.image = monster.weaponImage()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    deinit {
        print("deinit detailviewcontroller")
    }
}

extension DetailViewController: MonsterSelectionDelegate {
    func monsterSelected(newMonster: Monster) {
        monster = newMonster
    }
}
