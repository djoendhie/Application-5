//
//  BeritaTableViewCell.swift
//  Aplikasiberita
//
//  Created by SMK IDN MI on 11/14/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class BeritaTableViewCell: UITableViewCell {
    @IBOutlet weak var labelJudul: UILabel!
    @IBOutlet weak var labelKategori: UILabel!
    @IBOutlet weak var labelIsi: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
