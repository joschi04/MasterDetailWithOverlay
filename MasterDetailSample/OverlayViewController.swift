//
//  OverlayViewController.swift
//  MasterDetailSample
//
//  Created by Jörg Tischer on 15.10.16.
//  Copyright © 2016 Jörg Tischer. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnDismissButtonPressed(_ sender: AnyObject) {
        (UIApplication.shared.delegate as! AppDelegate).dismissOverlay()
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
