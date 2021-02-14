//
//  ISOIDCell.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 12/02/2021.
//

import UIKit

class ISOIDCell: UITableViewCell , IsoCellView{
    
    @IBOutlet weak var name: UILabel!
    
    func configure(viewModel: IsoViewModel) {
        DispatchQueue.main.async {
            self.name.text = viewModel.name
        }
        print(name.text ?? "" + viewModel.name)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
