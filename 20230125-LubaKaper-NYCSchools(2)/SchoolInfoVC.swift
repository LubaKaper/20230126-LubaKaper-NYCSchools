//
//  SchoolInfoVC.swift
//  20230125-LubaKaper-NYCSchools(2)
//
//  Created by Liubov Kaper  on 1/26/23.
//

import UIKit

class SchoolInfoVC: UIViewController {
    
    private var school: School
    
    private var scores = [Score]()
    
    private let detailView = SchoolDetailView()
    
    private let url = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    init(score: School) {
        self.school = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        fetchScoreAPIData(URL: url) { result in
            self.scores = result
            DispatchQueue.main.async {
                self.detailView.reloadInputViews()
                self.updateUI()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let lblTitle = UILabel()
        
        let titleAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.black]
        
        let attributeString = NSMutableAttributedString(string: school.schoolName, attributes: titleAttribute)
        
        lblTitle.attributedText = attributeString
        lblTitle.numberOfLines = 2
        
        lblTitle.sizeToFit()
        navigationItem.titleView = lblTitle
    }
    
    
    
    private func updateUI() {
        
        //navigationItem.title = school.schoolName
        detailView.schoolAddressLabel.text = "School address: \(school.primaryAddressLine1), \(school.city)."
        for score in scores {
            if school.dbn == score.dbn {
                detailView.numberOfTakersLabel.text = "Number of students who took SAT: \(score.numOfSatTestTakers)"
                detailView.mathScoreLabel.text = "Math average Score: \(score.satMathAvgScore)"
                detailView.readingScoreLabel.text = "Reading average Score: \(score.satCriticalReadingAvgScore)"
                detailView.writingScoreLabel.text = "Writing average Score: \(score.satWritingAvgScore)"
            }
        }
    }
}
