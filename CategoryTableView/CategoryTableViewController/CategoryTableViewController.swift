//
//  CategoryTableViewController.swift
//  CategoryTableView
//
//  Created by 谢飞 on 2019/2/28.
//  Copyright © 2019 谢飞. All rights reserved.
//

import UIKit

class CategoryTableViewController: UIViewController,CategoryTableViewDelegate,CategoryTableViewDataSource {
    
    @IBOutlet weak var categoryTableView: CategoryTableView!
    var dataSource:[[CategoryMenuModel]]?
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
        initDataSource()
        categoryTableView.reloadData()
    }

    
    func initSubViews() {
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        self.categoryTableView.menuIndexPath = IndexPath.init(row: 0, section: 0)
        self.categoryTableView.menuTableView.register(UINib.init(nibName: "MenuTableViewCell", bundle: .main), forCellReuseIdentifier: "menuCellId")
        self.categoryTableView.objectsTableView.register(UINib.init(nibName: "ObjectTableViewCell", bundle: .main), forCellReuseIdentifier: "objectCellId")
    }
    
    func initDataSource()  {
        dataSource = [[CategoryMenuModel]]()
        let menuNames = [["组件","模块"],["总线","调度","接口"]]
        let count = menuNames.count
        
        for index in 0...count-1 {
            let subMCout = menuNames[index].count
            var menuGroup = [CategoryMenuModel]()
            for subMIndex in 0...subMCout-1 {
                let menuModel = CategoryMenuModel()
                menuModel.cellId = "menuCellId"
                menuModel.cellHeight = 60
                menuModel.menuName = menuNames[index][subMIndex]
                menuModel.objects = [[CategoryObjectModel]]()
                for _ in 0...4 {
                    var objects = [CategoryObjectModel]()
                    for oSubIndex in 0...3 {
                        let object = CategoryObjectModel()
                        object.cellId = "objectCellId"
                        object.cellHight = 120
                        object.objectName = menuNames[index][subMIndex] + "\(oSubIndex)"
                        objects.append(object)
                    }
                    menuModel.objects.append(objects)
                }
                menuGroup.append(menuModel)
            }
            dataSource?.append(menuGroup)
        }
    }
    
    
    func menuTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func objectTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func menuNumberOfSections(in tableView: UITableView) -> Int {
        return  dataSource!.count
    }
    
    func menuTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource![section].count
    }
    
    func menuTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.dataSource![indexPath.section][indexPath.row]
        let cell:MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: model.cellId) as! MenuTableViewCell
        cell.update(model:model)
        return cell
        
    }
    

    func objectNumberOfSections(in tableView: UITableView) -> Int {
        let menuModel = dataSource![categoryTableView!.menuIndexPath.section][categoryTableView!.menuIndexPath.row]
        return menuModel.objects!.count
    }
    
    func objectTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let menuModel = dataSource![categoryTableView!.menuIndexPath.section][categoryTableView!.menuIndexPath.row]
        return menuModel.objects![section].count
    }
    
    func objectTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuModel = dataSource![categoryTableView!.menuIndexPath.section][categoryTableView!.menuIndexPath.row]
        let objectModel = menuModel.objects[indexPath.section][indexPath.row]
        let cell:ObjectTableViewCell = tableView.dequeueReusableCell(withIdentifier: objectModel.cellId) as! ObjectTableViewCell
        cell.update(model:objectModel)
        return cell
    }
    
    
    func objectTableView(_ tableView: UITableView, dataForRowAt indexPath: IndexPath) -> CategoryObjectModel {
        let menuModel = dataSource![categoryTableView!.menuIndexPath.section][categoryTableView!.menuIndexPath.row]
        return menuModel.objects[indexPath.section][indexPath.row]
    }
    
    func menuTableView(_ tableView: UITableView, modelForRowAt indexPath: IndexPath) -> CategoryMenuModel {
        return dataSource![indexPath.section][indexPath.row]

    }
    

 

}
