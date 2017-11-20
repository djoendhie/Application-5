//
//  DetailViewController.swift
//  Aplikasiberita
//
//  Created by SMK IDN MI on 11/14/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var Judul: UILabel!
    @IBOutlet weak var Isi: UITextView!
    @IBOutlet weak var Kategori: UILabel!
    
    var passJudul:String?
    var passKategori:String?
    var passIsi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Judul.text = passJudul
        Kategori.text = passKategori
        Isi.text = passIsi

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
