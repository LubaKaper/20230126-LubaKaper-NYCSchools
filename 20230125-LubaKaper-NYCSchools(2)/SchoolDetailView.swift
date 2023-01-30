//
//  SchoolDetailView.swift
//  20230125-LubaKaper-NYCSchools(2)
//
//  Created by Liubov Kaper  on 1/26/23.
//

import UIKit

class SchoolDetailView: UIView {
    
    public lazy var schoolAddressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Address"
        label.textColor = .white
        label.backgroundColor = .systemMint
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    public lazy var numberOfTakersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Number of students who took SAT: No Data"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemTeal
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    public lazy var mathScoreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Math score: No Data"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemYellow
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    public lazy var readingScoreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Reading score: No Data"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemYellow
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    public lazy var writingScoreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Writing score: No Data"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemYellow
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupSchoolAddressLabelConstraint()
        setupNumberOfTakersLabelConstraint()
        setupMathScoreLabelConstraint()
        setupReadingScoreLabelConstraint()
        setupWritingScoreLabelConstraint()
    }
    
    private func setupSchoolAddressLabelConstraint() {
        addSubview(schoolAddressLabel)
        schoolAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            schoolAddressLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            schoolAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            schoolAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            schoolAddressLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
        ])
    }
    private func setupNumberOfTakersLabelConstraint() {
        addSubview(numberOfTakersLabel)
        numberOfTakersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfTakersLabel.topAnchor.constraint(equalTo:schoolAddressLabel.bottomAnchor, constant: 8),
            numberOfTakersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            numberOfTakersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            numberOfTakersLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
    }
    private func setupMathScoreLabelConstraint() {
        addSubview(mathScoreLabel)
        mathScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mathScoreLabel.topAnchor.constraint(equalTo: numberOfTakersLabel.bottomAnchor, constant: 8),
            mathScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            mathScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            mathScoreLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
    }
    private func setupReadingScoreLabelConstraint() {
        addSubview(readingScoreLabel)
        readingScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            readingScoreLabel.topAnchor.constraint(equalTo: mathScoreLabel.bottomAnchor, constant: 8),
            readingScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            readingScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            readingScoreLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
    }
    private func setupWritingScoreLabelConstraint() {
        addSubview(writingScoreLabel)
        writingScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            writingScoreLabel.topAnchor.constraint(equalTo: readingScoreLabel.bottomAnchor, constant: 8),
            writingScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            writingScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            writingScoreLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
    }
    
}
