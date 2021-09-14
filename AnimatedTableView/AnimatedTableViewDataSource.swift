//
//  AnimatedTableViewDataSource.swift
//  AnimatedTableView
//
//  Created by SuXinDe on 2021/9/14.
//  Copyright © 2021 su xinde. All rights reserved.
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




