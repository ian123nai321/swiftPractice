//
//  SFSafariViewController.swift
//  3DTouchDemo
//
//  Created by 吳政緯 on 2017/1/21.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit
import SafariServices

extension SFSafariViewController {
    
    override open var previewActionItems : [UIPreviewActionItem] {
        
        let deleteAction =  UIPreviewAction(title: "删除",
                                            style: UIPreviewActionStyle.destructive) {
                                                (previewAction,viewController) in
                                                
                                                NSLog("Delete")
                                                
        }
        
        let doneAction = UIPreviewAction(title: "完成",
                                         style: UIPreviewActionStyle.default) {
                                            (previewAction, viewController) in
                                            print(previewAction, viewController)
       
       

                                            NSLog("Done")
        }
        
        
                                            
        let change1Action =  UIPreviewAction(title: "改變收尋網址1",
                                            style: UIPreviewActionStyle.default) {
                                                (previewAction,viewController) in
                                                
                                                NSLog("Change the URL")
                                                
        }
        
        let change2Action = UIPreviewAction(title: "改變收尋網址2",
                                         style: UIPreviewActionStyle.default) {
                                            (previewAction, viewController) in
                                            
                                            
                                            
                                            NSLog("Change another URL")
        }

        let moreAction = UIPreviewActionGroup(title: "更多...",
                                              style: UIPreviewActionStyle.default , actions: [change1Action,change2Action] )
        
        return [deleteAction,doneAction,moreAction]
    }

}
