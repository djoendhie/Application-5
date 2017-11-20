//
//  DetailKatViewController.swift
//  Aplikasiberita
//
//  Created by SMK IDN MI on 11/15/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class DetailKatViewController: UIViewController {
    @IBOutlet weak var Judullabel: UILabel!
    @IBOutlet weak var Katlabel: UILabel!
    @IBOutlet weak var Isilabel: UITextView!
    
    var passJud:String?
    var passKat:String?
    var passISI:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Judullabel.text = passJud
        Katlabel.text = passKat
        Isilabel.text = passISI

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
