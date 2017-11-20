//
//  KategoriTableViewController.swift
//  Aplikasiberita
//
//  Created by SMK IDN MI on 11/14/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class KategoriTableViewController: UITableViewController {

    var arrkategori = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //memanggil data json menggunakan alamofire
        Alamofire.request("http://localhost/Aplikasiberita/index.php/api/getKategori").responseJSON { (response) in
            
            // check responsse
            
            if response.result.isSuccess {
                
                //kalau response sucess kita amnbil json
                let json = JSON(response.result.value as Any)
                // get json array dari jason d atas
                self.arrkategori = json["data"].arrayObject as! [[String : String]]
                //check d log
                //print self attar berita
                //chect jumlah array
                if self.arrkategori.count > 0 {
                    
                    // refresh table view
                    self.tableView.reloadData()
                }
            }
            else{
                
                print("error server")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrkategori.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKategori", for: indexPath) as! KategoriTableViewCell

        var serverid = arrkategori[indexPath.row]
        
        //print server id
        var id_kategori = serverid["id_kategori"]
        let kategori = serverid["nama_kategori"]
        
        //pindah ke label
        cell.labelKat.text = kategori
        return cell
    }
    
    // ;pindah k layout >
    // dan melempar id kategori
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let idStoryBoard = storyboard?.instantiateViewController(withIdentifier:"beritakategori") as! BeritaKategoriTableViewController
        
        let id_kategori = arrkategori[indexPath.row] ["id_kategori"]
        // variable menampilkan nampung idkategori lempar
        idStoryBoard.nampungId = id_kategori
        
        show(idStoryBoard, sender:  self)
        
    }

  }
