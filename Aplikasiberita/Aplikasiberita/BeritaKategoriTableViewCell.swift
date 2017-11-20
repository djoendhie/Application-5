//
//  BeritaKategoriTableViewCell.swift
//  Aplikasiberita
//
//  Created by SMK IDN MI on 11/14/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class BeritaKategoriTableViewCell: UITableViewCell {
    @IBOutlet weak var imgBerita: UIImageView!
    @IBOutlet weak var labelJud: UILabel!
    @IBOutlet weak var labelISI: UILabel!
    @IBOutlet weak var labelKat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
