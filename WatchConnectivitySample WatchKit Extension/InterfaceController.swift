//
//  InterfaceController.swift
//  WatchConnectivitySample WatchKit Extension
//
//  Created by akio0911 on 2015/10/13.
//  Copyright © 2015年 akio0911. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet var label: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        print("willActivate")
        
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        if WCSession.defaultSession().reachable {
            print("reachable")
            
            let message = ["From":"Watch", "To":"Phone"]
            WCSession.defaultSession().sendMessage(message,
                replyHandler: { (dic:[String : AnyObject]) -> Void in
                    print("Watch : success : dic = \(dic)")
                    self.label.setText("dic = \(dic)")
                },
                errorHandler: { (error:NSError) -> Void in
                    print("Watch : error : \(error.localizedDescription)")
                }
            )
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension InterfaceController : WCSessionDelegate {
    
}

