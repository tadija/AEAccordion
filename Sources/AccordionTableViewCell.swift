import UIKit

/**
    This class is used as a expandable `UITableViewCell` for `AccordionTableViewController`.

    Just subclass it and override setter of the `expanded` property to update UI based on this property.

    You can also override `setExpanded:animated:` in order to animate this UI update.
*/
open class AccordionTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    /// Flag which tells if the cell is expanded.
    open private(set) var expanded = false
    
    // MARK: Actions
    
    /**
        Public setter of the `expanded` property (this should be overriden by a subclass for custom UI update)
    
        - parameter expanded: `true` if the cell should be expanded, `false` if it should be collapsed.
        - parameter animated: If `true` action should be animated.
    */
    open func setExpanded(_ expanded: Bool, animated: Bool) {
        self.expanded = expanded
    }

}
