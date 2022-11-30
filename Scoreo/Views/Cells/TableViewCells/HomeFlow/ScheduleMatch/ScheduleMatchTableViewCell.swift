//
//  ScheduleMatchTableViewCell.swift
//  Scoreo
//
//  Created by Remya on 11/29/22.
//

import UIKit



class ScheduleMatchTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblHomeName: UILabel!
    
    @IBOutlet weak var lblAwayName: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var imgHomeLogo: UIImageView!
    @IBOutlet weak var imgAwayLogo: UIImageView!
    @IBOutlet weak var lblDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(obj:MatchList?){
        
        lblName.text = obj?.leagueNameShort
        lblHomeName.text = obj?.homeName
        lblAwayName.text = obj?.awayName
        imgAwayLogo.setImage(with: obj?.awayLogo, placeholder: Utility.getPlaceHolder())
        imgHomeLogo.setImage(with: obj?.homeLogo, placeholder: Utility.getPlaceHolder())
       
        
            let matchDate = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
            lblTime.text = Utility.formatDate(date: matchDate, with: .hhmm2)
        lblDate.text = Utility.formatDate(date: matchDate, with: .mmmdyyyy)
    }
    
    
    func configureCell(obj:BasketballMatchList?){
        
        switch Utility.getCurrentLang(){
        case "en":
            lblName.text = obj?.leagueNameShortEn
            lblHomeName.text = obj?.homeTeamEn
            lblAwayName.text = obj?.awayTeamEn
        case "cn":
            lblName.text = obj?.leagueNameShortCn
            lblHomeName.text = obj?.homeTeamNameCn
            lblAwayName.text = obj?.awayTeamNameCn
        case "id":
            lblName.text = obj?.leagueNameShortId
            lblHomeName.text = obj?.homeTeamNameId
            lblAwayName.text = obj?.awayTeamNameId
        case "vi":
            lblName.text = obj?.leagueNameShortVi
            lblHomeName.text = obj?.homeTeamNameVi
            lblAwayName.text = obj?.awayTeamNameVi
        case "th":
            lblName.text = obj?.leagueNameShortTh
            lblHomeName.text = obj?.homeTeamNameTh
            lblAwayName.text = obj?.awayTeamNameTh
        default:
            break
        
        }
                
        imgAwayLogo.setImage(with: obj?.awayLogo, placeholder: Utility.getPlaceHolder())
        imgHomeLogo.setImage(with: obj?.homeLogo, placeholder: Utility.getPlaceHolder())
        
        
        let matchDate = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
        lblTime.text = Utility.formatDate(date: matchDate, with: .hhmm2)
        lblDate.text = Utility.formatDate(date: matchDate, with: .mmmdyyyy)
    }


}
