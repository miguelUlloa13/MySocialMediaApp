//
//  FooterView.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

@IBDesignable
final class FooterView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var ParticipantNameLabel: UILabel!
    @IBOutlet weak var ParticipantNameContentLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DateContentLabel: UILabel!
    
    // MARK: - Properties
    var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.customLabels()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
        self.customLabels()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

    }
    
    // MARK: - Methods
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "FooterView") else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @objc func updateTime() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: Date())
        
        dateFormatter.timeStyle = .medium
        DateContentLabel.text = formattedDate
        
    }
    
     private func customLabels() {

         ParticipantNameLabel.text = "Participant name:"
         ParticipantNameLabel.myCustomFont(size: 20, textColor: .white)
         
         ParticipantNameContentLabel.text = "Miguel Angel Martinez Ulloa"
         ParticipantNameContentLabel.myCustomFont(size: 20, textColor: .white)
         
         DateLabel.text = "Date:"
         DateLabel.myCustomFont(size: 20, textColor: .white)
         
         DateContentLabel.myCustomFont(size: 20, textColor: .white)
        
     }
    
}
