//
//  QuestionViewCell.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 16/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit

class QuestionViewCell: UITableViewCell {

    @IBOutlet weak var responseNumber: UILabel!
    @IBOutlet weak var reponseBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
