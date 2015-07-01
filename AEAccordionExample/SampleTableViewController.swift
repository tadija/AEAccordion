//
//  SampleTableViewController.swift
//  AEAccordion
//
//  Created by Marko Tadic on 6/26/15.
//  Copyright © 2015 AE. All rights reserved.
//

import UIKit

class SampleTableViewController: AEAccordionTableViewController {
    
    // MARK: - Properties
    
    private let cellIdentifier = "CustomTableViewCell"
    private let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as? String
        registerCell()
        expandFirstCell()
    }
    
    // MARK: - Helpers
    
    func registerCell() {
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func expandFirstCell() {
        let firstCellIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        expandedIndexPaths.append(firstCellIndexPath)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.headerView.dayLabel.text = days[indexPath.row]
        cell.detailView.imageView.image = UIImage(named: "0\(indexPath.row + 1)")
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return expandedIndexPaths.contains(indexPath) ? 200.0 : 50.0
    }

}