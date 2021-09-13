//
//  AnimatedTableView.swift
//  AnimatedTableView
//
//  Created by SuXinDe on 2020/3/1.
//  Copyright © 2020 su xinde. All rights reserved.
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

@objc public protocol AnimatedTableViewDelegate {
    
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

open class AnimatedTableViewCell: UITableViewCell {
    
    public static let cellResuableIdentifier = "AnimatedTableViewCell"
    
}

public typealias AnimatedTableViewAnimationBlock = (_ layer: CALayer, _ speed: CGFloat) -> CGFloat

open class AnimatedTableView: UIView {
    
    fileprivate var tableView: UITableView!
    
    var customAnimationBlock: AnimatedTableViewAnimationBlock?
    
    public var tableViewBackgroundColor: UIColor? {
        get {
            return tableView.backgroundColor
        }
        set {
            tableView.backgroundColor = newValue
        }
    }
    
    public init(frame: CGRect = CGRect.zero,
                style: UITableView.Style = .plain,
                aninmationStyle: AnimatedTableViewAnimationStyle = .none,
                customAnimationBlock: AnimatedTableViewAnimationBlock? = nil) {
        
        super.init(frame: frame)
//        self.backgroundColor = .clear
        
        tableView = UITableView(frame: frame, style: style)
        tableView.delegate = self
        tableView.dataSource = self
        tableView?.register(
            AnimatedTableViewCell.self,
            forCellReuseIdentifier: AnimatedTableViewCell.cellResuableIdentifier
        )
        
        self.customAnimationBlock = customAnimationBlock
        
        if aninmationStyle == .custom {
            let msg =
            "### [ AnimatedTableView ] ###: If aninmationStyle is assigned to `.custom`, customAnimationBlock can't be assgined to 'nil'"
            assert((customAnimationBlock != nil), msg)
        }
        
        self.aninmationStyle = aninmationStyle
        self.addSubview(tableView)
        
    }
    
    public var aninmationStyle: AnimatedTableViewAnimationStyle = .curl
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var preDelegate: UITableViewDelegate?
    fileprivate var lastScrollPosition: CGPoint = .zero
    fileprivate var currentScrollPosition: CGPoint = .zero
    
    fileprivate var scrollSpeed: CGPoint {
        get {
            return CGPoint(x: lastScrollPosition.x - currentScrollPosition.x,
                           y: lastScrollPosition.y - currentScrollPosition.y)
        }
    }
    
    public var dataSource: AnimatedTableViewDataSource?
    public var delegate: AnimatedTableViewDelegate?
    
    
    public func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    
    public func register(_ cellClass: AnyClass?,
                         forCellReuseIdentifier identifier: String) {
        tableView.register(cellClass,
                           forCellReuseIdentifier: identifier)
    }
    
    open override class var layerClass: AnyClass {
        return CATransformLayer.self
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        preDelegate?.scrollViewDidScroll?(scrollView)
        
    }
    
    public func reloadData() {
        tableView.reloadData()
    }
    
}

fileprivate typealias __TableViewDataSource__ = AnimatedTableView
extension __TableViewDataSource__: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        return dataSource?.tableView(self,
                                     numberOfRowsInSection: section) ?? 0
    }
    
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource?.tableView(self,
                                     cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections?(in: self) ?? 1
    }
    
    
    
    public func tableView(_ tableView: UITableView,
                          titleForHeaderInSection section: Int) -> String? {
        return dataSource?.tableView?(self,
                                      titleForHeaderInSection: section)
    }
    
    
    
    public func tableView(_ tableView: UITableView,
                          titleForFooterInSection section: Int) -> String? {
        return dataSource?.tableView?(self,
                                      titleForFooterInSection: section)
    }
    
    
    
    public func tableView(_ tableView: UITableView,
                          canEditRowAt indexPath: IndexPath) -> Bool {
        return dataSource?.tableView?(self,
                                      canEditRowAt: indexPath) ?? false
    }
    
    
    
    public func tableView(_ tableView: UITableView,
                          canMoveRowAt indexPath: IndexPath) -> Bool {
        return dataSource?.tableView?(self,
                                      canMoveRowAt: indexPath) ?? false
    }
    
    
    // Index
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataSource?.sectionIndexTitles?(for: self)
    }
    
    
    public func tableView(_ tableView: UITableView,
                          sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return dataSource?.tableView?(self,
                                      sectionForSectionIndexTitle: title, at: index) ?? 0
    }
    
    
    
    public func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCell.EditingStyle,
                          forRowAt indexPath: IndexPath) {
        dataSource?.tableView?(self,
                               commit: editingStyle,
                               forRowAt: indexPath)
    }
    
    
    
    public func tableView(_ tableView: UITableView,
                          moveRowAt sourceIndexPath: IndexPath,
                          to destinationIndexPath: IndexPath) {
        dataSource?.tableView?(self,
                               moveRowAt: sourceIndexPath,
                               to: destinationIndexPath)
    }
    
    
}

fileprivate typealias __TableViewDelegate__ = AnimatedTableView
extension __TableViewDelegate__: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        delegate?.tableView?(self, willDisplayHeaderView: view, forSection: section)
    }
    
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        delegate?.tableView?(self, willDisplayFooterView: view, forSection: section)
    }
    
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.tableView?(self, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        delegate?.tableView?(self, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        delegate?.tableView?(self, didEndDisplayingFooterView: view, forSection: section)
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.tableView?(self, heightForRowAt: indexPath) ?? 0.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.tableView?(self, heightForHeaderInSection: section) ?? 0.0
    }
    
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return delegate?.tableView?(self, heightForFooterInSection: section) ?? 0.0
    }
    
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.tableView?(self, estimatedHeightForRowAt: indexPath) ?? 0.0
    }
    
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.tableView?(self, estimatedHeightForHeaderInSection: section) ?? 0.0
    }
    
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return delegate?.tableView?(self, estimatedHeightForFooterInSection: section) ?? 0.0
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return delegate?.tableView?(self, viewForHeaderInSection: section)
    }
    
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return delegate?.tableView?(self, viewForFooterInSection: section)
    }
    
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        delegate?.tableView?(self, accessoryButtonTappedForRowWith: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return delegate?.tableView?(self, shouldHighlightRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        delegate?.tableView?(self, didHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        delegate?.tableView?(self, didUnhighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return delegate?.tableView?(self, willSelectRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return delegate?.tableView?(self, willDeselectRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.tableView?(self, didSelectRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        delegate?.tableView?(self, didDeselectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return delegate?.tableView?(self, editingStyleForRowAt: indexPath) ?? .none
    }
    
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return delegate?.tableView?(self, titleForDeleteConfirmationButtonForRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return delegate?.tableView?(self, editActionsForRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return delegate?.tableView?(self, leadingSwipeActionsConfigurationForRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return delegate?.tableView?(self, trailingSwipeActionsConfigurationForRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return delegate?.tableView?(self, shouldIndentWhileEditingRowAt: indexPath) ?? false
    }
    
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        delegate?.tableView?(self, willBeginEditingRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        delegate?.tableView?(self, didEndEditingRowAt: indexPath)
    }
    
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return delegate?.tableView?(self, targetIndexPathForMoveFromRowAt: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) ?? IndexPath(item: 0, section: 0)
    }
    
    
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return delegate?.tableView?(self, indentationLevelForRowAt: indexPath) ?? 0
    }
    
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return delegate?.tableView?(self, shouldShowMenuForRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return delegate?.tableView?(self, canPerformAction: action, forRowAt: indexPath, withSender: sender) ?? false
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        delegate?.tableView?(self, performAction: action, forRowAt: indexPath, withSender: sender)
    }
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return delegate?.tableView?(self, canFocusRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        return delegate?.tableView?(self, shouldUpdateFocusIn: context) ?? false
    }
    
    
    public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        delegate?.tableView?(self, didUpdateFocusIn: context, with: coordinator)
    }
    
    
    public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        return delegate?.indexPathForPreferredFocusedView?(in: self)
    }
    
    
    public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        delegate?.tableView?(self,
                             shouldSpringLoadRowAt: indexPath,
                             with: context) ?? false
    }
    
    
    public func tableView(_ tableView: UITableView,
                          willDisplay cell: UITableViewCell,
                          forRowAt indexPath: IndexPath) {
        
        delegate?.tableView?(self, willDisplay: cell, forRowAt: indexPath)
        
        guard aninmationStyle != .none else {
            return
        }
        
        var tableViewCellAnimationBlock: AnimatedTableViewAnimationBlock = {(_, _) in
            return AnimatedTableViewDuration.zero
        }
        
        if let animaitonBlock = aninmationStyle.animationBlock() {
            tableViewCellAnimationBlock = animaitonBlock
        } else {
            
            if let customAnimationBlock = customAnimationBlock {
                tableViewCellAnimationBlock = customAnimationBlock
            } else {
                let msg =
                    "### [ AnimatedTableView ] ###: If aninmationStyle is assigned to `.custom`, customAnimationBlock can't be assgined to 'nil'"
                assert(false, msg)
            }
        }
        
        let speed = scrollSpeed.y
        let normalizedSpeed = CGFloat.maximum(-1.0, CGFloat.maximum(1.0, speed/2.0))
        
        DispatchQueue.main.async {
            let animationDuration = tableViewCellAnimationBlock(cell.layer, normalizedSpeed)
            //            UIView.beginAnimations(nil, context: nil)
            //            UIView.setAnimationDuration(TimeInterval(animationDuration))
            //            cell.layer.transform = CATransform3DIdentity
            //            cell.layer.opacity = 1.0
            //            UIView.commitAnimations()
            UIView.animate(withDuration: TimeInterval(animationDuration),
                           animations: {
                            cell.layer.transform = CATransform3DIdentity
                            cell.layer.opacity = 1.0
                           }, completion: nil)
        }
        
    }
    

}

@objc public class AnimatedTableViewDuration: NSObject {
    public static let `default`: CGFloat = 0.2
    public static let zero: CGFloat = 0.0
}
    
@objc public enum AnimatedTableViewAnimationStyle: Int {
    case curl
    case fade
    case fan
    case flip
    case helix
    case tilt
    case wave
    case custom
    case none
    
    fileprivate func animationBlock() -> AnimatedTableViewAnimationBlock? {
        switch self {
            case .curl:
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
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
                return block
            case .fade:
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
                    if speed != 0.0 {
                        layer.opacity = 1.0 - fabsf(Float(speed))
                    }
                    return 2 * AnimatedTableViewDuration.default
                }
                return block
            case .fan:
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
                    var transform: CATransform3D = CATransform3DIdentity
                    transform = CATransform3DTranslate(transform,
                                                       (-layer.bounds.size.width)/2.0,
                                                       0.0,
                                                       0.0)
                    transform = CATransform3DRotate(transform,
                                                    (-CGFloat.pi)/2.0*speed,
                                                    0.0,
                                                    0.0,
                                                    1.0)
                    layer.transform = CATransform3DTranslate(transform,
                                                             layer.bounds.size.width/2.0,
                                                             0.0,
                                                             0.0)
                    layer.opacity = 1.0 - fabsf(Float(speed))
                    return AnimatedTableViewDuration.default
                }
                return block
            case .flip:
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
                    var transform: CATransform3D = CATransform3DIdentity
                    transform = CATransform3DTranslate(transform,
                                                       0,
                                                       speed.sign() * layer.bounds.size.height/2.0,
                                                       0.0)
                    transform = CATransform3DRotate(transform,
                                                    speed.sign()*(CGFloat.pi)/2.0,
                                                    1.0,
                                                    0.0,
                                                    0.0)
                    layer.transform = CATransform3DTranslate(transform, 0.0,
                                                             -speed.sign()*layer.bounds.size.height/2.0,
                                                             0.0)
                    layer.opacity = 1.0 - fabsf(Float(speed))
                    return (2.0 * AnimatedTableViewDuration.default)
                }
                return block
            case .helix:
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
                    var transform: CATransform3D = CATransform3DIdentity
                    transform = CATransform3DTranslate(transform,
                                                       0.0,
                                                       speed.sign() * layer.bounds.size.height/2.0,
                                                       0.0)
                    transform = CATransform3DRotate(transform, CGFloat.pi, 0.0, 1.0, 0.0)
                    layer.transform = CATransform3DTranslate(transform,
                                                             0.0,
                                                             -(speed.sign()) * layer.bounds.size.height/2.0,
                                                             0.0)
                    layer.opacity = Float(1.0 - 0.2 * abs(speed))
                    return (2 * AnimatedTableViewDuration.default)
                }
                return block
            case .tilt:
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
                    if (speed != 0.0) { // Don't animate the initial state
                        layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
                        layer.opacity = Float(1.0 - abs(speed))
                    }
                    return 2 * AnimatedTableViewDuration.default
                }
                return block
            case .wave:
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
                    if (speed != 0.0) { // Don't animate the initial state
                        layer.transform = CATransform3DMakeTranslation(-layer.bounds.size.width/2.0,
                                                                       0.0,
                                                                       0.0)
                    }
                    return AnimatedTableViewDuration.default
                }
                return block
            case .custom:
                return nil
            default: // .none
                let block: AnimatedTableViewAnimationBlock = {(layer, speed) in
                    return AnimatedTableViewDuration.zero
                }
                return block
        }
    }
}

fileprivate extension CGFloat {
    func sign() -> CGFloat {
        return ((self < 0.0) ? -1.0 : 1.0)
    }
}


    
