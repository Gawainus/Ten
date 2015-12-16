//
//  NotificationInfoCell.swift
//  Ten
//
//  Created by gt on 15/10/12.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit

class NotificationInfoCell: UITableViewCell {
    var titleLable:UILabel!
    var timeLabel:UILabel!
    var detailLabel:UILabel!
    var splitLine:UIView!
    var notificationFrame:NotificationFrame!{
        didSet{
            titleLable = UILabel(frame:notificationFrame.titleFrame)
            timeLabel = UILabel(frame: notificationFrame.timeFrame)
            detailLabel = UILabel(frame: notificationFrame.detailFrame)
            splitLine = UILabel (frame: notificationFrame.splitFrame)
            splitLine.backgroundColor = UIColor.whiteColor()
            titleLable.font = UIFont(name: "PTSans", size: 17)
            titleLable.textColor = UIColor.orangeColor()
            timeLabel.font = UIFont(name: "PTSans", size: 13)
            timeLabel.textColor = UIColor.whiteColor()
            timeLabel.textAlignment = .Right
            detailLabel.font = UIFont(name: "PTSans", size: 15)
            detailLabel.textColor = UIColor.whiteColor()
            detailLabel.numberOfLines = 0
            titleLable.text = notificationFrame.notification.title
            timeLabel.text = notificationFrame.notification.time + " am"
            detailLabel.text = notificationFrame.notification.detail as String
            self.addSubview(timeLabel)
            self.addSubview(detailLabel)
            self.addSubview(titleLable)
            self.addSubview(splitLine)
            }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor  = UIColor.blackColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func setNeedsLayout() {
        titleLable = UILabel(frame:notificationFrame.titleFrame)
        timeLabel = UILabel(frame: notificationFrame.timeFrame)
        detailLabel = UILabel(frame: notificationFrame.detailFrame)
        titleLable.font = UIFont.systemFontOfSize(17)
        titleLable.textColor = UIColor.orangeColor()
        timeLabel.font = UIFont.systemFontOfSize(13)
        timeLabel.textColor = UIColor.whiteColor()
        detailLabel.font = UIFont.systemFontOfSize(15)
        detailLabel.textColor = UIColor.whiteColor()
        titleLable.text = notificationFrame.notification.title
        timeLabel.text = notificationFrame.notification.time + " am"
        detailLabel.text = notificationFrame.notification.detail as String
    }

}