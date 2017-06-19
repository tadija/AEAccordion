//
//  SampleTableViewController.swift
//  AEAccordionExample
//
//  Created by Marko Tadic on 6/26/15.
//  Copyright © 2015 AE. All rights reserved.
//

import AEAccordion

final class SampleTableViewController: AccordionTableViewController {
    
    // MARK: Properties

    private let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        expandFirstCell()
    }
    
    // MARK: Helpers
    
    func registerCell() {
        let cellNib = UINib(nibName: SampleTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: SampleTableViewCell.reuseIdentifier)
    }
    
    func expandFirstCell() {
        let firstCellIndexPath = IndexPath(row: 0, section: 0)
        expandedIndexPaths.append(firstCellIndexPath)
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.reuseIdentifier, for: indexPath)
        
        if let cell = cell as? SampleTableViewCell {
            cell.day.text = days[indexPath.row]
            cell.weatherIcon.image = UIImage(named: "0\(indexPath.row + 1)")
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return expandedIndexPaths.contains(indexPath) ? 200.0 : 50.0
    }

}
