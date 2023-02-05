//
//  DetailViewController.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//
import UIKit

class DetailViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var totalTestTakersLabel: UILabel!
    
    // MARK: - Properties
    private var detailViewModel: DetailViewModel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNavigationBarUIData()
        setUIStyle()
        setUIData()
    }
    
    func configure(viewModel: DetailViewModel) {
        self.detailViewModel = viewModel
    }
    
    
    private func setUIData() {
        self.title = detailViewModel.satScore.schoolName
        writingScoreLabel.text = detailViewModel.satScore.satWritingAvgScore
        mathScoreLabel.text = detailViewModel.satScore.satMathAvgScore
        readingScoreLabel.text = detailViewModel.satScore.satCriticalReadingAvgScore
        totalTestTakersLabel.text = detailViewModel.satScore.numOfSatTestTakers
    }
    
    private func setNavigationBarUIData() {
        self.title = self.detailViewModel.satScore.schoolName
        self.navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor:UIColor.customRed]
    }
    
    private func setUIStyle() {
        writingScoreLabel.textColor = UIColor.customGreen
        mathScoreLabel.textColor = UIColor.customGreen
        readingScoreLabel.textColor = UIColor.customGreen
        totalTestTakersLabel.textColor = UIColor.customGreen
    }
}
