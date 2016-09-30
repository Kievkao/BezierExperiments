//
//  SelectionVC.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/22/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

enum BezierDemoType: Int  {
    case TopRoundedCorners = 0
    case TopArc
    case TopCurve
    case CatHead
    case MickeyMouse
    case AnimatePath
}

class SelectionVC: UITableViewController {
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let drawVC = storyboard?.instantiateViewController(withIdentifier: "DrawVC") as! DrawVC
        drawVC.demoType = BezierDemoType(rawValue: indexPath.row)
        
        navigationController?.pushViewController(drawVC, animated: true)
    }
}
