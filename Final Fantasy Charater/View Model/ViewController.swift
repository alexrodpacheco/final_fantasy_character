//
//  ViewController.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 11/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CharacterSucess, CharacterError {
    
    @IBOutlet weak var tableView: UITableView!
    
    let characterViewModel = CharacterViewModel()
    var character: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        characterViewModel.loadCharacter()
        characterViewModel.sucessDelegate = self
        characterViewModel.errorDelegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        //fetch cell
        let name = character[indexPath.row].name
        
        //configure cell
        cell.textLabel?.text = name
        
        return cell
    }
    
    func characterSucess(sucess: [Character]) {
        self.character = sucess
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func characterError(error: Error) {
        print(error)
    }
}

