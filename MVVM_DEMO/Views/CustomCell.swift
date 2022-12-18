//
//  CustomCell.swift
//  MVVM_DEMO
//
//  Created by Vishal Kumar on 18/12/22.
//

import UIKit
import SDWebImage

class CustomCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var loginData:LoginDataModel? {
        didSet {
            imgAvatar.sd_setImage(with: URL.init(string: loginData?.avatar_url ?? ""))
            lblID.text = "\(loginData?.id ?? 0)"
            lblName.text = loginData?.login
            lblType.text = loginData?.type
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
