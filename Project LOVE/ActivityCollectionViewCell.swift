//
//  ActivityCollectionViewCell.swift
//  Project LOVE
//
//  Created by SDC-USER on 24/11/25.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
@IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var activityDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(activity: Activity) {
        activityImageView.image = UIImage(named: activity.image)
        activityNameLabel.text = activity.name
        activityDescriptionLabel.text = activity.description
    }

}
