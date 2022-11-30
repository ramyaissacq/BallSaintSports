//
//  LeaguePopupViewController.swift
//  Scoreo
//
//  Created by Remya on 10/29/22.
//

import UIKit


class LeaguePopupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    var  originalLeagues: [TodayHotLeague]?
    var  leagues: [TodayHotLeague]?
    var callSelected:((TodayHotLeague)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func actionTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    static func instance()-> LeaguePopupViewController
    {
        let storyboard = UIStoryboard.init(name: "Dialogs", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LeaguePopupViewController") as! LeaguePopupViewController
        return vc
    }
    
    func initialSettings(){
        searchbar.placeholder = "Search".localized
        tableView.register(UINib(nibName: "LeaguePopupTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
 
}


extension LeaguePopupViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LeaguePopupTableViewCell
        cell.lblLeague.text = leagues?[indexPath.row].leagueName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = leagues?[indexPath.row]{
        callSelected?(obj)
        }
        self.dismiss(animated: true)
    }
    
}


extension LeaguePopupViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            filterLeagues(searchText: searchText)
        }
        else{
            self.leagues = self.originalLeagues
            self.tableView.reloadData()
        }
    }
    
    func filterLeagues(searchText:String){
        leagues?.removeAll()
        leagues = originalLeagues?.filter{$0.leagueName?.contains(searchText) ?? false}
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.leagues = self.originalLeagues
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
