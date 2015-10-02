//
//  TutorialChildViewController.swift
//  Ten
//
//  Created by Yifang Zhang on 10/2/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit

class TutorialChildViewController: UIViewController {

    var pageIndex : Int = 0
    var titleText : String = ""
    var imageFile : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: imageFile)!)
        
        let label = UILabel(frame: CGRectMake(0, 0, view.frame.width, 200))
        label.textColor = UIColor.whiteColor()
        label.text = titleText
        label.textAlignment = .Center
        view.addSubview(label)
        
        /*let button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(20, view.frame.height - 110, view.frame.width - 40, 50)
        button.backgroundColor = UIColor(red: 138/255.0, green: 181/255.0, blue: 91/255.0, alpha: 1)
        button.setTitle(titleText, forState: UIControlState.Normal)
        button.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)*/

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
