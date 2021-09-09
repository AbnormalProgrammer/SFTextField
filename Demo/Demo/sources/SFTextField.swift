//
//  SFTextField.swift
//  Demo
//
//  Created by Stroman on 2021/9/1.
//

import UIKit

class SFTextField: UITextField,UITextFieldDelegate {
    deinit {
        self.removeObserver(self, forKeyPath: "isEditing")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.addObserver(self, forKeyPath: "isEditing", options: NSKeyValueObservingOptions.init(rawValue: NSKeyValueObservingOptions.initial.rawValue|NSKeyValueObservingOptions.new.rawValue), context: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "isEditing" {
            print("键值对正在观察对象:",self.hash)
        }
    }
    
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
    
    @objc private func processTextChanging(_ textField:UITextField) -> Void {
        textingClosure?(textField.text ?? "")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.addTarget(self, action: #selector(processTextChanging(_:)), for: .editingChanged)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.removeTarget(self, action: #selector(processTextChanging(_:)), for: .editingChanged)
    }
    
    var textingClosure:((String) -> Void)?
}
