//
//  GETFilmsTVC.swift
//  GET People and Films
//
//  Created by admin on 24/12/2021.
//

import UIKit

class GETFilmsTVC: UITableViewController {
    
    let filmsApi = "https://swapi.dev/api/films/"
    var filmsArr:Films?

    override func viewDidLoad() {
        super.viewDidLoad()
        getFilms()
    }
    
    func getFilms(){
        APIManager.getApiResponse(urlPath: filmsApi) { data, error in
            if error != nil {
                print("\(String(describing : error?.localizedDescription))")
            }else{
                if let data = data {
                    self.filmsArr = self.parseLogic(data: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func parseLogic(data : Data) -> Films?{
        do{
            let films = try JSONDecoder().decode(Films.self , from:data)
            return films
        }catch{
            print(error.localizedDescription)
            return nil
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filmsArr?.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath) as! FilmsTableViewCell
        cell.titleLabel.text = filmsArr?.results[indexPath.row].title
        cell.directorLabel.text = filmsArr?.results[indexPath.row].director
        cell.releaseDateLabel.text = filmsArr?.results[indexPath.row].release_date
        cell.openingCrawlLabel.text = filmsArr?.results[indexPath.row].opening_crawl

        return cell
    }


}
