//
//  TableViewCell.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import UIKit

protocol ActionSelectedDelegate: AnyObject {
    func getItemSelected(_ item: Person)
}

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var nameItem: UILabel!
    @IBOutlet weak var emailItem: UILabel!
    @IBOutlet weak var aliasItem: UILabel!
    @IBOutlet weak var phoneItem: UILabel!
    @IBOutlet weak var idiomItem: UILabel!
    @IBOutlet weak var addresItem: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    
    private var personData: Person? = nil
    public weak var delegateAction: ActionSelectedDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageItem.layer.borderWidth = 2
        imageItem.layer.borderColor = UIColor.purple.cgColor
        imageItem.layer.cornerRadius = imageItem.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func getName(_ name: Name) -> String {
        return "\(name.title) \(name.first) \(name.last)"
    }
    
    private func getlocation(location: Location) -> String{
        return "\(location.city), \(location.state)"
    }
    
    func setupCell(from item: Person) {
        personData = item
        idiomItem.text = item.nat
        phoneItem.text = item.phone
        emailItem.text = item.email
        nameItem.text = getName(item.name)
        aliasItem.text = item.login.username
        imageItem.loadUrlImage(from: item.picture.large)
        addresItem.text = getlocation(location: item.location)
    }
    
    
    @IBAction func cellEvent(_ sender: Any) {
        if let delegate = delegateAction, let personValue = personData {
            delegate.getItemSelected(personValue)
        }
    }
}
