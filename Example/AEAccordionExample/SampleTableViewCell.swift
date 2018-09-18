/**
 *  https://github.com/tadija/AEAccordion
 *  Copyright (c) Marko Tadić 2015-2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import AEAccordion

final class SampleTableViewCell: AccordionTableViewCell {
    
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
        
        if animated {
            let alwaysOptions: UIView.AnimationOptions = [.allowUserInteraction,
                                                         .beginFromCurrentState,
                                                         .transitionCrossDissolve]
            let expandedOptions: UIView.AnimationOptions = [.transitionFlipFromTop, .curveEaseOut]
            let collapsedOptions: UIView.AnimationOptions = [.transitionFlipFromBottom, .curveEaseIn]
            let options = expanded ? alwaysOptions.union(expandedOptions) : alwaysOptions.union(collapsedOptions)
            
            UIView.transition(with: detailView, duration: 0.3, options: options, animations: {
                self.toggleCell()
            }, completion: nil)
        } else {
            toggleCell()
        }
    }
    
    // MARK: Helpers
    
    private func toggleCell() {
        detailView.isHidden = !expanded
        arrow.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi) : .identity
    }
    
}
