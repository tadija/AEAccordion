//
// AEXibceptionView.swift
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
    This class is used for building nested XIB files (Xibception)

    Example - Imagine that we have next files:
    * FirstView.h, FirstView.m, FirstView.xib
    * SecondView.h, SecondView.m, SecondView.xib
    * CustomCell.h, CustomCell.m, CustomCell.xib
    Our goal is to add FirstView and SecondView to CustomCell.xib,
    but to load these views from their XIB files instead from code.

    These are the steps:
    1. FirstView and SecondView must inherit from XibceptionView
    2. In their XIB files File's Owner must be set to their class (FirstView, SecondView)
    3. In their XIB files root view should be connected to File's Owner contentView property
    4. In cell's XIB file File's Owner and Cell itself must be set to CustomCell class
    5. Add views to CustomCell.xib and set their class to FirstView and SecondView
*/

public class AEXibceptionView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet public lazy var contentView: UIView! = {
        let className = NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last
        return NSBundle.mainBundle().loadNibNamed(className, owner: self, options: nil).first as! UIView
    }()
    
    // MARK: - Lifecycle

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(contentView)
    }

}