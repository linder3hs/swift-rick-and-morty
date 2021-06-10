//
//  CharacterCollectionViewCell.swift
//  semana14AF
//
//  Created by Linder Hassinger on 10/06/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCharacter: UIImageView!
    
    @IBOutlet weak var lbnName: UILabel!
    
    func setUpDate(character: Results) {
        let urlImage = URL(string: character.image)!
        
        if let dataImage = try? Data(contentsOf: urlImage) {
            imageCharacter.image = UIImage(data: dataImage)
        }
        
        lbnName.text = character.name
    }
}
