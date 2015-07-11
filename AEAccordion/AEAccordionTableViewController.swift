//
// AEAccordionTableViewController.swift
//
// Copyright (c) 2015 Marko Tadić <tadija@me.com> http://tadija.net
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

/**
    This class is used for accordion effect in `UITableViewController`.

    Just subclass it and implement `tableView:heightForRowAtIndexPath:`
    (based on information in `expandedIndexPaths` property).
*/

public class AEAccordionTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    /// Array of `NSIndexPath` objects for all of the expanded cells.
    public var expandedIndexPaths = [NSIndexPath]()
    
    // MARK: - Actions
    
    /**
        Expand or collapse the cell.
    
        :param: cell Cell that should be expanded or collapsed.
        :param: animated If `true` action should be animated.
    */
    public func toggleCell(cell: AEAccordionTableViewCell, animated: Bool) {
        if !cell.expanded {
            expandCell(cell, animated: animated)
        } else {
            collapseCell(cell, animated: animated)
        }
    }
    
    // MARK: - UITableViewDelegate
    
    /**
        `AEAccordionTableViewController` will set cell to be expanded or collapsed without animation.
    
        Tells the delegate the table view is about to draw a cell for a particular row.
    
        :param: tableView The table-view object informing the delegate of this impending event.
        :param: cell A table-view cell object that tableView is going to use when drawing the row.
        :param: indexPath An index path locating the row in tableView.
    */
    public override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? AEAccordionTableViewCell {
            let expanded = expandedIndexPaths.contains(indexPath)
            cell.setExpanded(expanded, animated: false)
        }
    }
    
    /**
        `AEAccordionTableViewController` will animate cell to be expanded or collapsed.
        
        Tells the delegate that the specified row is now deselected.
        
        :param: tableView A table-view object informing the delegate about the row deselection.
        :param: indexPath An index path locating the deselected row in tableView.
    */
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? AEAccordionTableViewCell {
            toggleCell(cell, animated: true)
        }
    }
    
    // MARK: - Helpers
    
    private func expandCell(cell: AEAccordionTableViewCell, animated: Bool) {
        if let indexPath = tableView.indexPathForCell(cell) {
            if !animated {
                cell.setExpanded(true, animated: false)
                addToExpandedIndexPaths(indexPath)
            } else {
                CATransaction.begin()
                
                CATransaction.setCompletionBlock({ () -> Void in
                    // 2. animate views after expanding
                    cell.setExpanded(true, animated: true)
                })
                
                // 1. expand cell height
                tableView.beginUpdates()
                addToExpandedIndexPaths(indexPath)
                tableView.endUpdates()
                
                CATransaction.commit()
            }
        }
    }
    
    private func collapseCell(cell: AEAccordionTableViewCell, animated: Bool) {
        if let indexPath = tableView.indexPathForCell(cell) {
            if !animated {
                cell.setExpanded(false, animated: false)
                removeFromExpandedIndexPaths(indexPath)
            } else {
                CATransaction.begin()
                
                CATransaction.setCompletionBlock({ () -> Void in
                    // 2. collapse cell height
                    self.tableView.beginUpdates()
                    self.removeFromExpandedIndexPaths(indexPath)
                    self.tableView.endUpdates()
                })
                
                // 1. animate views before collapsing
                cell.setExpanded(false, animated: true)
                
                CATransaction.commit()
            }
        }
    }
    
    private func addToExpandedIndexPaths(indexPath: NSIndexPath) {
        expandedIndexPaths.append(indexPath)
    }
    
    private func removeFromExpandedIndexPaths(indexPath: NSIndexPath) {
        if let index = self.expandedIndexPaths.indexOf(indexPath) {
            self.expandedIndexPaths.removeAtIndex(index)
        }
    }

}
