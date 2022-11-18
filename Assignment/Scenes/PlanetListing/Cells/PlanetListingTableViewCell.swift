//
//  PlanetListingTableViewCell.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import UIKit

class PlanetListingTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var planetNameLebel: Label! {
        didSet {
            planetNameLebel.set(typographyStyle: .Heading)
        }
    }
    
    @IBOutlet weak var climateLabel: Label! {
        didSet {
            climateLabel.set(typographyStyle: .SubHeading)
        }
    }
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        planetNameLebel.setText("")
        climateLabel.setText("")
        thumbImageView.image = nil
    }
    
    /// Set planet details to the cell
    /// - Parameter planet: seleted planet description
    func setData(_ planet: Planet) {
        planetNameLebel.setText(L10n.planetName(planet.name ?? ""))
        climateLabel.setText(L10n.currentClimate(planet.climate ?? ""))
        thumbImageView.sd_setImage(with: URL(string: L10n.planetImageUrl(planet.name ?? "")), placeholderImage:Asset.placeholder.image)
    }
    
}
