//
//  SchoolListVC.swift
//  20230125-LubaKaper-NYCSchools(2)
//
//  Created by Liubov Kaper  on 1/25/23.
//

import UIKit

class SchoolListVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SchoolCell.self, forCellReuseIdentifier: SchoolCell.identifier)
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
    
    let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    private var schools = [School]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        title = "NYC Schools"
        navigationController?.navigationBar.prefersLargeTitles = true
        confugureSearchBar()
    
        fetchAPIData(URL: url) { result in
            self.schools = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func confugureSearchBar() {
        searchBar.placeholder = "type school name"
        searchBar.autocapitalizationType = .none
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
    
    
   // func configureTableView() {
        //view.addSubview(tableView)
        //set other delegates
        
        //set row height
       // tableView.rowHeight = 100
        //register cells
       // tableView.register(SchoolCell.self, forCellReuseIdentifier: "schoolCell")
        //set constraints
        //tableView.pin(to: view)
      //  queryAPI()
        
   // }
    
//    private func queryAPI() {
//        SchoolAPIClient.fetchSchool { [weak self] (result) in
//            switch result {
//            case failure(let appError):
//                print("error fetching schools : \(appError)")
//            case .success(let schools):
//                self?.schools = schools
//            }
//        }
//    }
    
}

extension SchoolListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolCell.identifier, for: indexPath) as? SchoolCell else {
            fatalError("Could not dequeue SchoolCell")
        }
        let school = schools[indexPath.row]
        //cell.configureCell(with: school)
        cell.schoolNameLabel.text = school.schoolName
        cell.backgroundColor = .systemMint
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("roow selected")
        let school = schools[indexPath.row]
        let schoolInfoVC = SchoolInfoVC(score: school)
        navigationController?.pushViewController(schoolInfoVC, animated: true)
    }
}
extension SchoolListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            fetchAPIData(URL: url) { result in
                self.schools = result
               
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            return
        }
        
        schools = schools.filter({ $0.schoolName.lowercased().contains(searchText.lowercased())
        })
        self.tableView.reloadData()
    }
}
