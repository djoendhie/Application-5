//
//  BeritaKategoriTableViewController.swift
//  Aplikasiberita
//
//  Created by SMK IDN MI on 11/14/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BeritaKategoriTableViewController: UITableViewController {
    
    var judSelected:String?
    var katSelected:String?
    var iSISelected:String?
    
    
    //deklarasi variable utuk menampung id yg d kirim
    var nampungId : String? = nil
    //dekjlarasi array berita
    var arrayberita = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("id + " + nampungId!)
        
        let params = ["id_kategori" : nampungId!]
        let url = "http://localhost/Aplikasiberita/index.php/api/getBeritaBYIdKategori"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                
                //        Alamofire.request(url, method: .post, Parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
                // check response
                if response.result.isSuccess {
                    //kalau response suces kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get jsonaray dari json arrayq
                    self.arrayberita = json["data"].arrayObject as! [[String : String]]
                    //check d log
                    //check jumlah array
                    if (self.arrayberita.count > 0){
                        
                        //refresh tableview
                        self.tableView.reloadData()
                    }
                }
                else{
                    
                    print("error server")
                    
                }
        })
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
        return arrayberita.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeritaKategori", for: indexPath) as! BeritaKategoriTableViewCell
        
        var serverid = arrayberita[indexPath.row]
        
        var id = serverid["id_berita"]
        let judul = serverid["judul"]
        let nama_kategori = serverid["nama_kategori"]
        let isiBerita = serverid["isi_berita"]
        //print judul
        
        
        //pindah k label
        cell.labelJud.text = judul
        cell.labelISI.text = isiBerita
        cell.labelKat.text = nama_kategori
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrayberita[indexPath.row]
        judSelected = task["judul"] as! String
        katSelected = task["id_cat"] as! String
        iSISelected = task["isi_berita"] as! String
        
        
        performSegue(withIdentifier: "passIsi", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passIsi" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arrayberita[indexPath.row]
                
                controller.passJudul = value["judul"] as! String
                controller.passKategori = value["id_cat"] as! String
                controller.passIsi = value["isi_berita"] as! String
                
            }
        }
    }
}
