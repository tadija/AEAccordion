//
//  CustomTableViewCell.swift
//  AEAccordion
//
//  Created by Marko Tadic on 6/26/15.
//  Copyright © 2015 AE. All rights reserved.
//

import UIKit

class CustomTableViewCell: AEAccordionTableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var headerView: HeaderView! {
        didSet {
            headerView.imageView.tintColor = UIColor.whiteColor()
        }
    }
    @IBOutlet weak var detailView: DetailView!
    
    // MARK: - Override
    
    override func setExpanded(expanded: Bool, animated: Bool) {
        super.setExpanded(expanded, animated: animated)
        
        if !animated {
            toggleCell()
        } else {
            let alwaysOptions: UIViewAnimationOptions = [.AllowUserInteraction, .BeginFromCurrentState, .TransitionCrossDissolve]
            let expandedOptions: UIViewAnimationOptions = [.TransitionFlipFromTop, .CurveEaseOut]
            let collapsedOptions: UIViewAnimationOptions = [.TransitionFlipFromBottom, .CurveEaseIn]
            let options: UIViewAnimationOptions = expanded ? alwaysOptions.union(expandedOptions) : alwaysOptions.union(collapsedOptions)
            
            UIView.transitionWithView(detailView, duration: 0.3, options: options, animations: { () -> Void in
                self.toggleCell()
                }, completion: nil)
        }
    }
    
    // MARK: - Helpers
    
    private func toggleCell() {
        detailView.hidden = !expanded
        headerView.imageView.transform = expanded ? CGAffineTransformMakeRotation(CGFloat(M_PI)) : CGAffineTransformIdentity
    }
    
}