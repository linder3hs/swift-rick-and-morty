//
//  ViewController.swift
//  semana14AF
//
//  Created by Linder Hassinger on 10/06/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    let url = "https://rickandmortyapi.com/api/character?page=2"
    
    var animateCharacter: [Results] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getDataFromApi()
        getDataFromApiModel()
        setUpCollectioView()
    }
    
    func setUpCollectioView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    func getDataFromApi() {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let results = json["results"]
                debugPrint(results)
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getDataFromApiModel() {
        AF.request(url, method: .get).responseJSON { response in
            
            guard let data = response.data else { return }
            
            do {
                // Logica de como obtener la data
                let decoder = JSONDecoder()
                let characters = try decoder.decode(Response.self, from: data)
                self.animateCharacter.append(contentsOf: characters.results)
                print("Count \(self.animateCharacter.count)")
                self.collectionView.reloadData()
//                for cartoon in self.animateCharacter {
//                    print(cartoon.name)
//                    print(cartoon.image)
//                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(animateCharacter.count)
        return animateCharacter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        cell.setUpDate(character: animateCharacter[indexPath.row])
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return print(animateCharacter[indexPath.row].name)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}
