//
//  ViewController.swift
//  Demo
//
//  Created by Stroman on 2021/9/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.testTextField.placeholderString = "浪里个浪"
        self.testTextField.placeholderColor = UIColor.systemRed
        self.testTextField.textingClosure = {
            print("闭包里面的textfield对象",self.textField2.hashValue)
            self.textField2.text = $0
        }
    }
    
    @IBOutlet weak var textField2: SFTextField!
    @IBOutlet weak var testTextField: SFTextField!
}

