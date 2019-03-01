//
//  ObjectTableViewCell.swift
//  CategoryTableView
//
//  Created by 谢飞 on 2019/3/1.
//  Copyright © 2019 谢飞. All rights reserved.
//

import UIKit

class ObjectTableViewCell: UITableViewCell {

    @IBOutlet weak var objectName: UILabel!
    @IBOutlet weak var objectImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(model:CategoryObjectModel) {
        objectName.text = model.objectName!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
