//
//  AnimatedTableViewDelegate.swift
//  AnimatedTableView
//
//  Created by SuXinDe on 2021/9/14.
//  Copyright © 2021 su xinde. All rights reserved.
//

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
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    
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
    
    @objc
    optional func tableView(_ tableView: AnimatedTableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool
}
