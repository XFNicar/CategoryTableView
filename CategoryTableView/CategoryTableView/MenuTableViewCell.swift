//
//  MenuTableViewCell.swift
//  CategoryTableView
//
//  Created by 谢飞 on 2019/3/1.
//  Copyright © 2019 谢飞. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func update(model:CategoryMenuModel)  {
         menuName.text = model.menuName!
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            backgroundColor = UIColor.init(red: 229.0/255, green: 229.0/255, blue: 229.0/255, alpha: 1)
        } else {
            backgroundColor = UIColor.init(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 1)
        }
    }
    
}
