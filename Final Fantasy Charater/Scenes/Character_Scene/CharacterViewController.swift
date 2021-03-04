//
//  ViewController.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 11/01/21.
//

import UIKit

class CharacterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CharacterSucess, CharacterError {
    
    @IBOutlet weak var tableView: UITableView!
    
    let characterViewModel = CharacterViewModel()
    var character: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Character Screen"
        
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
        let avatarID = String(character[indexPath.row].id)
        let imageString = character[indexPath.row].avatar
        
        //configure cell
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = avatarID
        
        guard let imageUrl = URL(string: imageString) else { return  cell }
        // Turning sync to async
        DispatchQueue.global().async {
            //this is happening on a background thread
            do {
                let content = try Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                    //this is happening on the main thread
                    cell.imageView?.image = UIImage(data: content)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        detailsVC?.characterID = character[indexPath.row].id
        
        self.navigationController?.pushViewController(detailsVC!, animated: true)
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

