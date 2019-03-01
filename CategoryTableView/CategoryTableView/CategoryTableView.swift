//
//  CategoryTableView.swift
//  CategoryTableView
//
//  Created by 谢飞 on 2019/2/28.
//  Copyright © 2019 谢飞. All rights reserved.
//

import UIKit

@objc protocol CategoryTableViewDelegate:AnyObject {
    
    @objc func menuTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    @objc func objectTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)

   
}

@objc protocol CategoryTableViewDataSource:AnyObject {
    @objc func menuTableView(_ tableView: UITableView,numberOfRowsInSection section:Int) -> Int
    @objc func menuTableView(_ tableView: UITableView,cellForRowAt indexPath:IndexPath) -> UITableViewCell
    @objc func menuNumberOfSections(in tableView: UITableView) -> Int
    @objc func menuTableView(_ tableView: UITableView,modelForRowAt indexPath:IndexPath) -> CategoryMenuModel
    
    
    @objc func objectTableView(_ tableView: UITableView,numberOfRowsInSection section:Int) -> Int
    @objc func objectTableView(_ tableView: UITableView,cellForRowAt indexPath:IndexPath) -> UITableViewCell
    @objc func objectNumberOfSections(in tableView: UITableView) -> Int
    
    @objc func objectTableView(_ tableView: UITableView,dataForRowAt indexPath:IndexPath) -> CategoryObjectModel
    
    
}

protocol CategoryMenuData {
    
}

protocol CategoryObjectData {
    
}


class CategoryMenuModel: NSObject {
    var cellHeight: CGFloat!
    var cellId: String!
    var objects: [[CategoryObjectModel]]!
    var menuName: String!
}


class CategoryObjectModel: NSObject {
    var cellHight: CGFloat!
    var cellId: String!
    var objectName:String?
    
}


class CategoryTableView: UIView,UITableViewDataSource,UITableViewDelegate {
    
    weak var dataSource: CategoryTableViewDataSource?
    weak var delegate: CategoryTableViewDelegate?
    var menuIndexPath:IndexPath!// = IndexPath.init(row: 0, section: 0)
    
    @IBOutlet var categoryTableView: UIView!
    @IBOutlet weak var menuBackgroundView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var objectsBackgroundView: UIView!
    @IBOutlet weak var objectsTableView: UITableView!
    
    func reloadData()  {
        self.menuTableView.reloadData()
        self.objectsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(menuTableView) {
            return self.dataSource!.menuTableView(tableView, numberOfRowsInSection: section)
        } else {
            return self.dataSource!.objectTableView(tableView, numberOfRowsInSection: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.isEqual(menuTableView) {
            return self.dataSource!.menuTableView(tableView, cellForRowAt: indexPath)
        } else  {
            return self.dataSource!.objectTableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.isEqual(menuTableView) {
            return self.dataSource!.menuNumberOfSections(in: tableView)
        } else  {
            return self.dataSource!.objectNumberOfSections(in: tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEqual(menuTableView) {
            menuIndexPath = indexPath
            self.objectsTableView.reloadData()
            return self.delegate!.menuTableView(tableView, didSelectRowAt: indexPath)
        } else  {
            return self.delegate!.objectTableView(tableView, didSelectRowAt: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.isEqual(menuTableView) {
            return dataSource!.menuTableView(tableView, modelForRowAt: indexPath).cellHeight
        } else {
            let menuModel = dataSource!.objectTableView(tableView, dataForRowAt: indexPath)
            return menuModel.cellHight
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let _ = Bundle.main.loadNibNamed("CategoryTableView", owner: self, options: nil)
        self.addSubview(categoryTableView)
        categoryTableView.frame = self.bounds
        
    }
    
    
}
