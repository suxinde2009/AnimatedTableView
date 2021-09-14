//
//  ViewController.swift
//  AnimatedTableViewDemo
//
//  Created by SuXinDe on 2020/3/11.
//  Copyright © 2020 su xinde. All rights reserved.
//

/*
 MIT License
 
 Copyright (c) 2011-Present __承_影__
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit
import AnimatedTableView
import SnapKit

class ViewController: UIViewController {

    lazy var tableView: AnimatedTableView = {
        let view = AnimatedTableView(
            frame: self.view.bounds,
            aninmationStyle: .curl
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
        
        let transitionButton =
            UIBarButtonItem(
                barButtonSystemItem: UIBarButtonItem.SystemItem.action,
                target: self,
                action: #selector(click(_:))
            )
        self.navigationItem.rightBarButtonItem = transitionButton
        self.updateTitle()
        
        
        tableView.snp.makeConstraints { (make) in
            make.bottom.top.left.right.equalTo(self.view)
        }

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
        tableView.backgroundColor = .gray
    }

    @objc func click(_ sender: AnyObject) {
        let actionSheet = UIAlertController(
            title: nil,
            message: "Pick an animation style",
            preferredStyle: .actionSheet
        )
        
        let action1 = UIAlertAction(title: "Curl", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .curl
            self?.updateTitle()
        }
        
        let action2 = UIAlertAction(title: "Fade", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .fade
            self?.updateTitle()
        }
        
        let action3 = UIAlertAction(title: "Fan", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .fan
            self?.updateTitle()
        }
        
        let action4 = UIAlertAction(title: "Flip", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .flip
            self?.updateTitle()
        }
        
        let action5 = UIAlertAction(title: "Helix", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .helix
            self?.updateTitle()
        }
        
        let action6 = UIAlertAction(title: "Tilt", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .tilt
            self?.updateTitle()
        }
        
        let action7 = UIAlertAction(title: "Wave", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .wave
            self?.updateTitle()
        }
        
        let action8 = UIAlertAction(title: "Custom", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .custom
            self?.tableView.customAnimationBlock = {(layer, speed) in
                
                var transform: CATransform3D = CATransform3DIdentity
                transform.m34 = 1.0 / -500.0
                transform = CATransform3DTranslate(transform,
                                                   (-layer.bounds.size.width)/2.0,
                                                   0.0,
                                                   0.0)
                transform = CATransform3DRotate(transform,
                                                CGFloat.pi/2.0,
                                                0.0,
                                                1.0,
                                                0.0)
                layer.transform = CATransform3DTranslate(transform,
                                                         layer.bounds.size.width/2.0,
                                                         0.0,
                                                         0.0)
                return AnimatedTableViewDuration.default
                
            }
            self?.updateTitle()
        }
        
        let action9 = UIAlertAction(title: "none", style: .default) {[weak self] (_) in
            self?.tableView.aninmationStyle = .none
            self?.updateTitle()
        }
        
        let action10 = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(action5)
        actionSheet.addAction(action6)
        actionSheet.addAction(action7)
        actionSheet.addAction(action8)
        actionSheet.addAction(action9)
        actionSheet.addAction(action10)
        
        actionSheet.modalPresentationStyle = .formSheet
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func updateTitle() {
        switch self.tableView.aninmationStyle {
            case .curl:
                self.title = "Curl"
            case .fade:
                self.title = "Fade"
            case .fan:
                self.title = "Fan"
            case .flip:
                self.title = "Flip"
            case .helix:
                self.title = "Helix"
            case .tilt:
                self.title = "Tilt"
            case .wave:
                self.title = "Wave"
            case .custom:
                self.title = "Custom"
            case .none:
                self.title = "None"
            default:
                self.title = "Curl"
        }
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
        return 50.0
    }
    
    func tableView(_ tableView: AnimatedTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundView = UIView(frame: .zero)
        cell.backgroundView?.snp.makeConstraints({ (make) in
            make.bottom.top.left.right.equalTo(cell)
        })
        
        return cell
    }
    
    func tableView(_ tableView: AnimatedTableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let color = UIColor(white: 0.9, alpha: 1.0)
        cell.backgroundView?.backgroundColor = (indexPath.row % 2 == 0 ? .white : color)
        
        cell.textLabel?.text = objects[indexPath.row]
        cell.textLabel?.textColor = .black
    }
    
}


