//
//  ViewController.swift
//  SwiftNavicon
//
//  Created by PK on 09/11/2015.
//  Copyright (c) 2015 PK. All rights reserved.
//

import UIKit
import SwiftNavicon

class ViewController: UIViewController {
    
    @IBOutlet weak var naviconBtn: Navicon!
    var codeNavicon : Navicon
    
    required init?(coder aDecoder: NSCoder) {
        self.codeNavicon = Navicon(frame: CGRectMake(120, 120, 150, 150))
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(codeNavicon)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func crossBtnPressed(sender: AnyObject) {
        naviconBtn.transformCross(animated: true)
        codeNavicon.transformCross(animated: true)
    }
    
    @IBAction func right90BtnPressed(sender: AnyObject) {
        naviconBtn.transformRotate(animated: true)
        codeNavicon.transformRotate(animated: true)
    }
    
    @IBAction func resetBtnPressed(sender: AnyObject) {
        naviconBtn.transformReset(animated: true)
        codeNavicon.transformReset(animated: true)
    }
}

