//
//  PCoinViewController.swift
//  Ten
//
//  Created by gt on 15/10/17.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit

enum pcoinModelType{
    case Pcoin,History,Transfer,Unlocked
}

class PCoinViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var topView : UIView!
    var pcoinItemList : UITableView!
    var modelType : pcoinModelType = .Unlocked
    let pcoinValue = [10,20,50,100]
    var item0:SettingButton!
    var item1:SettingButton!
    var item2:SettingButton!
    var item3:SettingButton!
    var selectedBtn:SettingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "P Coin"
        //topview
        topView = UIView(frame: CGRectMake(0, 64, SCREEN_WIDTH, TAP_BAR_HEIGHT))
        let len = SCREEN_WIDTH/4
        item0 = SettingButton(frame: CGRectMake(0, 0, len, TAP_BAR_HEIGHT))
        item1 = SettingButton(frame: CGRectMake(len, 0, len, TAP_BAR_HEIGHT))
        item2 = SettingButton(frame: CGRectMake(2*len, 0, len, TAP_BAR_HEIGHT))
        item3 = SettingButton(frame: CGRectMake(3*len, 0, len, TAP_BAR_HEIGHT))
        item0.setImage(UIImage(named: "tab_pcoin_purchase"), forState: .Normal)
        item1.setImage(UIImage(named: "tab_pcoin_history"), forState: .Normal)
        item2.setImage(UIImage(named: "tab_pcoin_transfer"), forState: .Normal)
        item3.setImage(UIImage(named: "tab_pcoin_unlocked"), forState: .Normal)
        item0.addTarget(self, action: "changeModel:", forControlEvents: .TouchUpInside)
        item1.addTarget(self, action: "changeModel:", forControlEvents: .TouchUpInside)
        item2.addTarget(self, action: "changeModel:", forControlEvents: .TouchUpInside)
        item3.addTarget(self, action: "changeModel:", forControlEvents: .TouchUpInside)
        item0.model = .Pcoin
        item1.model = .History
        item2.model = .Transfer
        item3.model = .Unlocked
        topView.addSubview(item0)
        topView.addSubview(item1)
        topView.addSubview(item2)
        topView.addSubview(item3)
        //tableview
        pcoinItemList = UITableView(frame: CGRectMake(0, CGRectGetMaxY(topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(topView.frame)))
        pcoinItemList.delegate = self
        pcoinItemList.dataSource = self
        pcoinItemList.backgroundColor = UIColor.blackColor()
        pcoinItemList.bounces = false
        pcoinItemList.separatorStyle = .None
        pcoinItemList.allowsSelection = false

        self.view.addSubview(topView)
        self.view.addSubview(pcoinItemList)
        selectedBtn = item0
        // Do any additional setup after loading the view.
    }
    
    func changeModel(sender:SettingButton){
        modelType = sender.model
        pcoinItemList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(modelType == .History){
            var cell = pcoinItemList.dequeueReusableCellWithIdentifier("historyCell") as? PCoinHistoryCell
            if(cell == nil){
                cell = PCoinHistoryCell.init(style: .Default, reuseIdentifier: "historyCell")
            }
            cell?.timeLabel.text = "Yesterday"
            cell?.pcoinLabel.text = "You bought \(pcoinValue[indexPath.row]) P Coin"
            cell?.priceLabel.text = "Price:\(pcoinValue[indexPath.row]/10) USD"
            return cell!
        }
        if(modelType == .Transfer){
            var cell = pcoinItemList.dequeueReusableCellWithIdentifier("transferCell") as? PCoinTransferCell
            if(cell == nil){
                cell = PCoinTransferCell.init(style: .Default, reuseIdentifier: "transferCell")
            }
            cell?.transfer = PCoinTransferModel()
            return cell!
        }
        if(modelType == .Unlocked){
            var cell = pcoinItemList.dequeueReusableCellWithIdentifier("unlockedCell") as? PCoinUnlockedCell
            if(cell == nil){
                cell = PCoinUnlockedCell.init(style: .Default, reuseIdentifier: "unlockedCell")
            }
            cell?.unlocked = PCoinUnlockedModel()
            return cell!
        }
        
        var cell = pcoinItemList.dequeueReusableCellWithIdentifier("purchaseCell") as? PCoinPurchaseCell
        if(cell == nil){
            cell = PCoinPurchaseCell.init(style: .Default, reuseIdentifier: "purchaseCell")
        }
        cell?.pcoinLabel.text = "\(pcoinValue[indexPath.row]) P Coin"
        cell?.priceLabel.text = "Price:\(pcoinValue[indexPath.row]/10) USD"
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(modelType == .History){
            return 4
        }
        if(modelType == .Transfer){
            return 4
        }
        if(modelType == .Unlocked){
            return 4
        }
        
        return 4
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(modelType == .History){
            return 64
        }
        if(modelType == .Transfer){
            return 75
        }
        if(modelType == .Unlocked){
            return 70
        }
        
        
        return 64
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
