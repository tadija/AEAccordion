//
//  CustomTableViewCell.swift
//  AEAccordion
//
//  Created by Marko Tadic on 6/26/15.
//  Copyright © 2015 AE. All rights reserved.
//

import UIKit

public class CustomTableViewCell: AEAccordionTableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var headerView: HeaderView! {
        didSet {
            headerView.imageView.tintColor = UIColor.whiteColor()
        }
    }
    @IBOutlet weak var detailView: DetailView!
    
    // MARK: - Override
    
    public override var expanded: Bool {
        didSet {
            detailView.hidden = !expanded
            headerView.imageView.transform = expanded ? CGAffineTransformMakeRotation(CGFloat(M_PI)) : CGAffineTransformIdentity
        }
    }

    override func setExpanded(expanded: Bool, withCompletion completion: (finished: Bool) -> Void) {
        let alwaysOptions: UIViewAnimationOptions = [.AllowUserInteraction, .BeginFromCurrentState, .TransitionCrossDissolve]
        let expandedOptions: UIViewAnimationOptions = [.TransitionFlipFromTop, .CurveEaseOut]
        let collapsedOptions: UIViewAnimationOptions = [.TransitionFlipFromBottom, .CurveEaseIn]
        let options: UIViewAnimationOptions = expanded ? alwaysOptions.union(expandedOptions) : alwaysOptions.union(collapsedOptions)
        UIView.transitionWithView(detailView, duration: 0.3, options: options, animations: { () -> Void in
            self.expanded = expanded
            }) { (finished) -> Void in
                completion(finished: finished)
        }
    }
    
}