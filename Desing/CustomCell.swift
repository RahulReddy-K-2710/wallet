//
//  CustomCell.swift
//  Desing
//
//  Created by Roja on 17/11/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
 //Outlets
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var contactImageContentView: UIView!
    @IBOutlet weak var contactImgView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var pointstLabel: UILabel!
    @IBOutlet weak var amtLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    // CornorRadius on contactImage
        contactImageContentView.layer.cornerRadius = 25
        contactImageContentView.clipsToBounds = true
        
        cellView.layer.cornerRadius = 6
        cellView.layer.masksToBounds = true
    }
    
    func prepareWallet(_ model: WalletModel) {
//        contentView.backgroundColor = .yellow
        btcLabel.text = model.btc
        amtLabel.text = model.amount
        progressLabel.text = model.progress
        pointstLabel.text = model.points
        contactImgView.image = UIImage(named: model.walletIcon)
        contactImageContentView.backgroundColor = model.iconColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
