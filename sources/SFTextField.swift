//
//  SFTextField.swift
//  Demo
//
//  Created by Stroman on 2021/9/1.
//

import UIKit

class SFTextField: UITextField {
    private func makePlaceholder() -> Void {
        let text:String = self.placeholderString ?? ""
        let textColor:UIColor = self.placeholderColor ?? UIColor.black
        let attributeString:NSMutableAttributedString = NSMutableAttributedString.init(string: text)
        attributeString.addAttributes([.font:self.font,.foregroundColor:textColor], range: NSRange.init(location: 0, length: text.count))
        self.attributedPlaceholder = attributeString
    }
    
    var placeholderColor:UIColor? {
        didSet {
            self.makePlaceholder()
        }
    }/*这是自定义的占位符颜色*/
    var placeholderString:String? {
        didSet {
            self.makePlaceholder()
        }
    }/*为了避免和本类中的占位符属性发生歧义，此处自定义一个*/
}
