//
//  ViewController.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 11/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let characterViewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        characterViewModel.loadCharacter()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

