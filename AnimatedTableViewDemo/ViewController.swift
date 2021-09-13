//
//  ViewController.swift
//  AnimatedTableViewDemo
//
//  Created by SuXinDe on 2020/3/11.
//  Copyright © 2020 su xinde. All rights reserved.
//

import UIKit
import AnimatedTableView

class ViewController: UIViewController {

    lazy var tableView: AnimatedTableView = {
        let view = AnimatedTableView(
            frame: self.view.bounds,
            aninmationStyle: .tilt //.custom // .wave // .flip // .helix //.fan // .fade //.curl
        )
        return view
    }()
    
    lazy var objects: [String] = {
        var array: [String] = []
        for idx in 0..<200 {
            array.append("Row\(idx)")
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }


}

fileprivate typealias __Delegate__ = ViewController
extension __Delegate__: AnimatedTableViewDataSource, AnimatedTableViewDelegate {
    func numberOfSections(in tableView: AnimatedTableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: AnimatedTableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: AnimatedTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: AnimatedTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = objects[indexPath.row]
        return cell
    }
}
