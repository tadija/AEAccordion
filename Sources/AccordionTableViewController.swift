/**
 *  https://github.com/tadija/AEAccordion
 *  Copyright (c) Marko Tadić 2015-2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import UIKit

/**
    This class is used for accordion effect in `UITableViewController`.

    Just subclass it and implement `tableView:heightForRowAtIndexPath:`
    (based on information in `expandedIndexPaths` property).
*/
open class AccordionTableViewController: UITableViewController {
    
    // MARK: Properties
    
    /// Array of `IndexPath` objects for all of the expanded cells.
    open var expandedIndexPaths = [IndexPath]()
    
    /// Flag that indicates if cell toggle should be animated. Defaults to `true`.
    open var isToggleAnimated = true
    
    /// Flag that indicates if `tableView` should scroll after cell is expanded, 
    /// in order to make it completely visible (if it's not already). Defaults to `true`.
    open var shouldScrollIfNeededAfterCellExpand = true
    
    /// Closure that will be called after any cell expand is completed.
    open var expandCompletionHandler: () -> Void = {}
    
    /// Closure that will be called after any cell collapse is completed.
    open var collapseCompletionHandler: () -> Void = {}
    
    // MARK: Actions
    
    /**
        Expand or collapse the cell.
    
        - parameter cell: Cell that should be expanded or collapsed.
        - parameter animated: If `true` action should be animated.
    */
    open func toggleCell(_ cell: AccordionTableViewCell, animated: Bool) {
        if cell.expanded {
            collapseCell(cell, animated: animated)
        } else {
            expandCell(cell, animated: animated)
        }
    }
    
    // MARK: UITableViewDelegate
    
    /// `AccordionTableViewController` will set cell to be expanded or collapsed without animation.
    open override func tableView(_ tableView: UITableView,
                                 willDisplay cell: UITableViewCell,
                                 forRowAt indexPath: IndexPath) {
        if let cell = cell as? AccordionTableViewCell {
            let expanded = expandedIndexPaths.contains(indexPath)
            cell.setExpanded(expanded, animated: false)
        }
    }
    
    /// `AccordionTableViewController` will animate cell to be expanded or collapsed.
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AccordionTableViewCell {
            toggleCell(cell, animated: isToggleAnimated)
        }
    }
    
    // MARK: Helpers
    
    private func expandCell(_ cell: AccordionTableViewCell, animated: Bool) {
        if let indexPath = tableView.indexPath(for: cell) {
            if !animated {
                addToExpandedIndexPaths(indexPath)
                cell.setExpanded(true, animated: false)
                tableView.reloadData()
                scrollIfNeededAfterExpandingCell(at: indexPath)
                expandCompletionHandler()
            } else {
                CATransaction.begin()
                
                CATransaction.setCompletionBlock { [weak self] in
                    self?.scrollIfNeededAfterExpandingCell(at: indexPath)
                    self?.expandCompletionHandler()
                }
                
                tableView.beginUpdates()
                addToExpandedIndexPaths(indexPath)
                cell.setExpanded(true, animated: true)
                tableView.endUpdates()
                
                CATransaction.commit()
            }
        }
    }
    
    private func collapseCell(_ cell: AccordionTableViewCell, animated: Bool) {
        if let indexPath = tableView.indexPath(for: cell) {
            if !animated {
                cell.setExpanded(false, animated: false)
                removeFromExpandedIndexPaths(indexPath)
                tableView.reloadData()
                collapseCompletionHandler()
            } else {
                CATransaction.begin()
                
                CATransaction.setCompletionBlock { [weak self] in
                    self?.collapseCompletionHandler()
                }
                
                tableView.beginUpdates()
                cell.setExpanded(false, animated: true)
                removeFromExpandedIndexPaths(indexPath)
                tableView.endUpdates()
                
                CATransaction.commit()
            }
        }
    }
    
    private func addToExpandedIndexPaths(_ indexPath: IndexPath) {
        expandedIndexPaths.append(indexPath)
    }
    
    private func removeFromExpandedIndexPaths(_ indexPath: IndexPath) {
        if let index = expandedIndexPaths.index(of: indexPath) {
            expandedIndexPaths.remove(at: index)
        }
    }
    
    private func scrollIfNeededAfterExpandingCell(at indexPath: IndexPath) {
        guard shouldScrollIfNeededAfterCellExpand,
            let cell = tableView.cellForRow(at: indexPath) as? AccordionTableViewCell else {
            return
        }
        let cellRect = tableView.rectForRow(at: indexPath)
        let isCompletelyVisible = tableView.bounds.contains(cellRect)
        if cell.expanded && !isCompletelyVisible {
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }

}
