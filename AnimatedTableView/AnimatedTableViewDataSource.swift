//
//  AnimatedTableViewDataSource.swift
//  AnimatedTableView
//
//  Created by SuXinDe on 2021/9/14.
//  Copyright © 2021 su xinde. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

@objc public protocol AnimatedTableViewDataSource {
    
    func tableView(_ tableView: AnimatedTableView,
                   numberOfRowsInSection section: Int) -> Int
    
    func tableView(_ tableView: AnimatedTableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    
    @objc
    optional func numberOfSections(in tableView: AnimatedTableView) -> Int // Default is 1 if not implemented
    
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            titleForHeaderInSection section: Int) -> String? // fixed font style. use custom view (UILabel) if you want something different
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            titleForFooterInSection section: Int) -> String?
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            canEditRowAt indexPath: IndexPath) -> Bool
    
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            canMoveRowAt indexPath: IndexPath) -> Bool
    
    
    // Index
    
    @objc
    optional func sectionIndexTitles(for tableView: AnimatedTableView) -> [String]? // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            sectionForSectionIndexTitle title: String, at index: Int) -> Int // tell table which section corresponds to section title/index (e.g. "B",1))
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            commit editingStyle: AnimatedTableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath)
}




