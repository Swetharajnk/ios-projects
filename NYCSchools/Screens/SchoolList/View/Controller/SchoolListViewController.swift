//
//  SchoolListViewController.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import UIKit

class SchoolListViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var schoolListTableView: UITableView!
    
    // MARK: - Properties
    let schoolListViewModel = SchoolListViewModel(withService: SchoolService())
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set title
        self.title = ScreenTitle.Countries
        
        // Register table cell
        schoolListTableView.registerCell(type: SchoolCell.self)
        
        // delegate the TableView
        schoolListTableView.dataSource = self
        schoolListTableView.delegate = self
        
        // Data Binding
        setupCountriesViewModelObserver()
        
        // fetch countries data
        self.schoolListViewModel.fetchSchoolList()
    }
    
    private func setupCountriesViewModelObserver() {
        schoolListViewModel.schoolLists.bind {[weak self] _ in
            DispatchQueue.main.async {
                self?.schoolListTableView.reloadData()
            }
        }
        
        schoolListViewModel.error.bind { [weak self] error in
            DispatchQueue.main.async {
                self?.displayErrorOnUI(message: error)
            }
        }
    }
    
    private func displayErrorOnUI(message: String?) {
       //show error
    }
}

// MARK: - UITableViewDataSource
extension SchoolListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolListViewModel.schoolLists.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: SchoolCell.self, for: indexPath) as? SchoolCell else {
            return UITableViewCell()
        }
        
        if let school = schoolListViewModel.schoolLists.value?[indexPath.row] {
            cell.configure(school)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate
extension SchoolListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let satScore = schoolListViewModel.schoolLists.value?[indexPath.row] else {
            return
        }
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.configure(viewModel: DetailViewModel(satScore: satScore))
        self.navigationController?.pushViewController(detailViewController,animated:true)
    }
}
