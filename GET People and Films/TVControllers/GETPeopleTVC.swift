//
//  GETPeopleTVC.swift
//  GET People and Films
//
//  Created by admin on 23/12/2021.
//

import UIKit

class GETPeopleTVC: UITableViewController {
    
    let peopleApi = "https://swapi.dev/api/people/"
    var peopleArr :People?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovieCharacters()

    }
    
    func getMovieCharacters(){
        APIManager.getApiResponse(urlPath: peopleApi) { data, error in
            if error != nil {
                print("\(String(describing : error?.localizedDescription))")
            }else{
                if let data = data {
                    self.peopleArr = self.parseLogic(data: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func parseLogic(data : Data) -> People?{
        do{
            let movie = try JSONDecoder().decode(People.self , from:data)
            return movie
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
        return self.peopleArr?.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleTableViewCell
        cell.nameLabel.text = self.peopleArr?.results[indexPath.row].name
        cell.birthYearLabel.text = self.peopleArr?.results[indexPath.row].birth_year
        cell.massLabel.text = self.peopleArr?.results[indexPath.row].mass
        cell.genderLabel.text = self.peopleArr?.results[indexPath.row].gender

        return cell
    }
   

}
