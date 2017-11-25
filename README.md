# AEAccordion

**UITableViewController with accordion effect (expand / collapse cells)**

[![Language Swift 4.0](https://img.shields.io/badge/Language-Swift%204.0-orange.svg?style=flat)](https://swift.org)
[![Platforms iOS](https://img.shields.io/badge/Platforms-iOS-lightgray.svg?style=flat)](http://www.apple.com)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](LICENSE)

[![CocoaPods Version](https://img.shields.io/cocoapods/v/AEAccordion.svg?style=flat)](https://cocoapods.org/pods/AEAccordion)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

> Simple and lightweight solution for making accordion effect in table view controller.  
> Show detailed content on demand.

![AEAccordion](http://tadija.net/public/AEAccordion.gif)

## Index
- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)
- [License](#license)

## Features
- Create accordion effect in table view controller with less effort
- Animate expansion / collapsing of cells as you want *(optional)*
- Automatic scroll on cell expansion to make entire cell visible *(optional)*

## Usage

- Subclass `AccordionTableViewCell` and override `setExpanded:animated:`.

```swift
import AEAccordion

final class ReadmeTableViewCell: AccordionTableViewCell {

    static let reuseIdentifier = "ReadmeTableViewCell"
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var detailView: DetailView!
    
    // MARK: Override
    
    override func setExpanded(_ expanded: Bool, animated: Bool) {
        super.setExpanded(expanded, animated: animated)
        
        if animated {
            UIView.transition(with: detailView, duration: 0.3, animations: {
                self.detailView.isHidden = !expanded
            }, completion: nil)
        } else {
            detailView.isHidden = !expanded
        }
    }
    
}
```

- Subclass `AccordionTableViewController` and configure cell height based on `expandedIndexPaths`.

```swift
import AEAccordion

final class ReadmeTableViewController: AccordionTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expandFirstCell()
    }
    
    func expandFirstCell() {
        let firstCellIndexPath = IndexPath(row: 0, section: 0)
        expandedIndexPaths.append(firstCellIndexPath)
    }
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return expandedIndexPaths.contains(indexPath) ? 200.0 : 50.0
    }
    
}
```

> For more details check out [Sources](Sources) and [Example](Example).

## Installation

- [Swift Package Manager](https://swift.org/package-manager/):

	```
	.Package(url: "https://github.com/tadija/AEAccordion.git", majorVersion: 2)
	```

- [Carthage](https://github.com/Carthage/Carthage):

	```ogdl
	github "tadija/AEAccordion"
	```

- [CocoaPods](http://cocoapods.org/):

	```ruby
	pod 'AEAccordion'
	```

## License
This code is released under the MIT license. See [LICENSE](LICENSE) for details.
