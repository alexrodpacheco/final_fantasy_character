//
//  DetailsViewController.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 24/02/21.
//

import UIKit

class DetailsViewController: UIViewController, DetailSucess, DetailError {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var expLevel: UILabel!
    @IBOutlet weak var expLevelMax: UILabel!
    @IBOutlet weak var level: UILabel!
    
    var characterID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detailViewModel = DetailViewModel()
        detailViewModel.sucessDelegate = self
        detailViewModel.sucessError = self
        
        guard let id = characterID else {
            return
            //TODO: Apresentar tela de erro
        }
        
        detailViewModel.loadDetail(withId: id)
    }
    
    func detailsSucess(sucess: DetailsClass) {
        
        expLevel.text = String(sucess.activeClassJob.expLevel)
        expLevelMax.text = String(sucess.activeClassJob.expLevelMax)
        level.text = String(sucess.activeClassJob.level)
        
        guard let imgURL = URL(string: sucess.avatar) else {
            //TODO: error
            return
        }
        
        do {
            let imageData = try Data(contentsOf: imgURL)
            guard let image: UIImage = UIImage(data: imageData) else {
                return
            }
            self.avatarImage.image = image
            
        } catch {
            print(error)
        }
    }
    
    func detailError(error: Error) {
        print(error)
    }
}
