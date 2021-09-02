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
    }
    
    @IBOutlet weak var testTextField: SFTextField!
}

