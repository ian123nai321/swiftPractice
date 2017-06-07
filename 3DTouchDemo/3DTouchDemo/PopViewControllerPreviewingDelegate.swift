//
//  File.swift
//  3DTouchDemo
//
//  Created by 吳政緯 on 2017/1/21.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit
import SafariServices

extension PopViewController:UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        return peekButton.frame.contains(location) ? SFSafariViewController(url: URL(string:"http://www.google.com")!) : nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        //show(viewControllerToCommit, sender: self)
        
        let popController = storyboard?.instantiateViewController(withIdentifier: "POP")
        show(popController!, sender: self)
    }
        
}
