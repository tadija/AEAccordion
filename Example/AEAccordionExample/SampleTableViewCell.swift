//
//  SampleTableViewCell.swift
//  AEAccordionExample
//
//  Created by Marko Tadic on 6/26/15.
//  Copyright © 2015 AE. All rights reserved.
//

import AEAccordion

class SampleTableViewCell: AccordionTableViewCell {
    
    static let reuseIdentifier = "SampleTableViewCell"
    
    // MARK: Outlets
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var arrow: UIImageView! {
        didSet {
            arrow.tintColor = UIColor.white
        }
    }
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    // MARK: Override
    
    override func setExpanded(_ expanded: Bool, animated: Bool) {
        super.setExpanded(expanded, animated: animated)
        
        if !animated {
            toggleCell()
        } else {
            let alwaysOptions: UIViewAnimationOptions = [.allowUserInteraction,
                                                         .beginFromCurrentState,
                                                         .transitionCrossDissolve]
            let expandedOptions: UIViewAnimationOptions = [.transitionFlipFromTop, .curveEaseOut]
            let collapsedOptions: UIViewAnimationOptions = [.transitionFlipFromBottom, .curveEaseIn]
            let options = expanded ? alwaysOptions.union(expandedOptions) : alwaysOptions.union(collapsedOptions)
            
            UIView.transition(with: detailView, duration: 0.3, options: options, animations: { () -> Void in
                self.toggleCell()
            }, completion: nil)
        }
    }
    
    // MARK: Helpers
    
    fileprivate func toggleCell() {
        detailView.isHidden = !expanded
        arrow.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi) : .identity
    }
    
}
