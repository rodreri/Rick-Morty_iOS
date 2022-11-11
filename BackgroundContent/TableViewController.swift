//
//  TableViewController.swift
//  BackgroundContent
//
//  Created by Erick Rodrigo Minero Pineda on 10/11/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var personajes = [Result]()
    var selectedCharacter : Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url=URL(string: "https://rickandmortyapi.com/api/character/") {
            do {
                let bytes = try Data(contentsOf: url)
                let rick = try JSONDecoder().decode(Rick.self, from: bytes)
                personajes = rick.results
            }catch{
                print("Error al obtener la URL")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personajes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personajeCell", for: indexPath)
        selectedCharacter = personajes[indexPath.row]
        cell.textLabel?.text = selectedCharacter!.name
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Llamamos al segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCharacter = personajes[indexPath.row]
        self.performSegue(withIdentifier: "goDetalle", sender: Self.self)
    }
    
    // Intent to detailsView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewController
        destination.recivedCharacter = selectedCharacter
    }
}
