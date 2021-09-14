//
//  AnimatedTableViewDelegate.swift
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

@objc public protocol AnimatedTableViewDelegate: UIScrollViewDelegate {
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, willDisplayHeaderView view: UIView, forSection section: Int)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, willDisplayFooterView view: UIView, forSection section: Int)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didEndDisplayingFooterView view: UIView, forSection section: Int)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, heightForHeaderInSection section: Int) -> CGFloat
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, heightForFooterInSection section: Int) -> CGFloat
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, viewForHeaderInSection section: Int) -> UIView?
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, viewForFooterInSection section: Int) -> UIView?
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, accessoryButtonTappedForRowWith indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didHighlightRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didUnhighlightRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath?
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didSelectRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didDeselectRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    
    @available(iOS 11.0, *)
    @objc
    optional func tableView(_ tableView: AnimatedTableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    
    @available(iOS 11.0, *)
    @objc
    optional func tableView(_ tableView: AnimatedTableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, willBeginEditingRowAt indexPath: IndexPath)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didEndEditingRowAt indexPath: IndexPath?)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, indentationLevelForRowAt indexPath: IndexPath) -> Int
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?)
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, canFocusRowAt indexPath: IndexPath) -> Bool
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)
    
    @objc
    optional func indexPathForPreferredFocusedView(in tableView: AnimatedTableView) -> IndexPath?
    
    
    @available(iOS 11.0, *)
    @objc
    optional func tableView(_ tableView: AnimatedTableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool
}
