//
//  ViewController.swift
//  BarCode
//
//  Created by varun bhola on 31/05/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var filter:CIFilter!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var generateImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.cornerRadius = 50
        btn.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateBtnWasPressed(_ sender: Any) {
        if let text =  textField.text{
            let data =  text.data(using: .ascii, allowLossyConversion: false)
            if segment.selectedSegmentIndex == 0{
                filter = CIFilter(name: "CICode128BarcodeGenerator")
            }else{
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            generateImage.image = image
        }
        
        
        
        
    }
    
}

