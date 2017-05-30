//
//  MainMenuController.swift
//  PPFApplier
//
//  Created by Victor Maia Aldecoa on 05/03/17.
//  Copyright © 2017 victoraldecoa. All rights reserved.
//

import Cocoa

class MainMenuController: NSWindowController {
    
    @IBOutlet weak var textFieldIso: NSTextField!
    @IBOutlet weak var textFieldPpf: NSTextField!
    
    override func awakeFromNib() {
        super.windowDidLoad()
    }

    @IBAction func findIso(_ sender: NSButton) {
        showOpenFilePanel { (path) in
            self.textFieldIso.stringValue = path;
        }
    }
    
    @IBAction func findPpf(_ sender: NSButton) {
        showOpenFilePanel { (path) in
            self.textFieldPpf.stringValue = path;
        }
    }
    
    @IBAction func apply(_ sender: NSButton) {
        let result = ApplyPatch(UnsafeMutablePointer(mutating: self.textFieldIso.stringValue),
                                UnsafeMutablePointer(mutating: self.textFieldPpf.stringValue));
        
        let alert = NSAlert();
        alert.addButton(withTitle: "OK");
        alert.messageText = result == 0 ? "PPF applied successfully!" : "An error ocurred";
        alert.runModal();
        
        resetView();
    }
    
    func resetView() {
        self.textFieldIso.stringValue = "";
        self.textFieldPpf.stringValue = "";
    }
    
    func showOpenFilePanel(completionHandler handler: @escaping (String) -> Swift.Void) {
        let panel = createPanel();
        panel.begin { (result) -> Void in
            if result == NSFileHandlingPanelOKButton {
                handler(panel.urls.first?.path ?? "");
            }
        }
    }
    
    func createPanel() -> NSOpenPanel {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        return openPanel;
    }
}
