//
//  DetailsViewController.swift
//  BackgroundContent
//
//  Created by Erick Rodrigo Minero Pineda on 10/11/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var characterImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    
    var recivedCharacter : Result?
    
    var labelCharacter  : [String:String] = [
        "nombre"  : "",
        "estatus" : "Status: ",
        "genero"  : "Genero: "
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let posterUrl = URL(string: recivedCharacter!.image) {
            URLSession.shared.dataTask(with: posterUrl) { (data, urlResponse, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.characterImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        nameLabel.text    = labelCharacter["nombre"]!  + recivedCharacter!.name
        statusLabel.text  = labelCharacter["estatus"]! + recivedCharacter!.status.rawValue
        genreLabel.text   = labelCharacter["genero"]!  + recivedCharacter!.gender.rawValue
    }
}
