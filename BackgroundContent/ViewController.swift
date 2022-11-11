//
//  ViewController.swift
//  BackgroundContent
//
//  Created by Erick Rodrigo Minero Pineda on 29/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = URLSessionConfiguration.default
        let sesion = URLSession(configuration: configuration)
        
        guard let laURL = URL(string: "https")
        else{return}
        
        let request = URLRequest(url: laURL)
        
        let tarea = sesion.dataTask(with:request) { datos, response, error in
            if nil != error {
                print ("algo salió mal \(String(describing: error?.localizedDescription))")
                return
            }
            guard let bytes = datos else {
                print ("Response sin datos")
                return
            }
            
            DispatchQueue.main.async {
                let imageview = UIImageView(frame: self.view.frame)
                imageview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                imageview.image = UIImage (data:bytes)
                self.view.addSubview(imageview)
            }// Hilo pricipal cambios en UI
        }
        tarea.resume()
    }


}

