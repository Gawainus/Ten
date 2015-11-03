//
//  SignUpController.swift
//  Ten
//
//  Created by gt on 15/11/2.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

let GTgrayColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)

import UIKit
import AFNetworking

class SignUpController: UIViewController {
    @IBOutlet weak var newPin: UITextField!
    @IBOutlet weak var newPinRe: UITextField!
    var emailAddr:String?
    var nextBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"navBar_newpin"), forBarMetrics: .Default)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_welcome")!)
        newPin.backgroundColor = GTgrayColor
        newPinRe.backgroundColor = GTgrayColor
        newPin.textColor = UIColor.whiteColor()
        newPinRe.textColor = UIColor.whiteColor()
        //nextBtn
        let x = (SCREEN_WIDTH-215)/2
        let y = SCREEN_HEIGHT-80
        nextBtn = UIButton(frame: CGRectMake(x,y,215,37))
        nextBtn.setImage(UIImage(named: "btn_next"), forState: .Normal)
        nextBtn.addTarget(self, action: "nextClick", forControlEvents: .TouchUpInside)
        self.view.addSubview(nextBtn)
        // Do any additional setup after loading the view.
    }
    func nextClick(){
        if(newPin.text == newPinRe.text){
            signupPost()
        }
    }
    
    func signupPost(){
        let manager = AFHTTPRequestOperationManager()
        let parameters = ["email":emailAddr,"pwd":newPinRe.text,"UUID":UUID,"timestamp":"00000","Device Token":deviceToken]
        /*[15/10/27 上午9:33:59] Yumen Tsao: email
        [15/10/27 上午9:34:06] Yumen Tsao: pwd
        [15/10/27 上午9:34:11] Yumen Tsao: UUID
        [15/10/27 上午9:34:17] Yumen Tsao: Device Token
        [15/10/27 上午9:36:16] Yumen Tsao: timestamp
        [15/10/27 上午9:36:43] Yumen Tsao: company code
        [15/10/27 上午9:37:17] Yumen Tsao: sha-256*/
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
