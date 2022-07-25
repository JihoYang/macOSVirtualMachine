//
//  AppDelegate.swift
//  macOSVirtualMachineApp
//
//  Created by Yang Ji-Ho on 2022/07/25.
//

import Foundation
import AppKit
import Virtualization

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet var window: NSWindow!
    @IBOutlet weak var virtualMachineView: VZVirtualMachineView!
    
    private var virtualMachineResponder: MacOSVirtualMachineDelegate?
    
#if arch(arm64)
    private var virtualMachine: VZVirtualMachine!
    
    private func createMacPlatform() -> VZMacPlatformConfiguration {
        let macPlatform = VZMacPlatformConfiguration()
        let auxiliaryStorage = VZMacAuxiliaryStorage(contentsOf: auxiliaryStorageURL)
        macPlatform.auxiliaryStorage = auxiliaryStorage
        
        if !FileManager.default.fileExists(atPath: vmBundlePath) {
            fatalError("Missing Virtual Machine Bundle at \(vmBundlePath). Run InstallationTool first to create it.")
        }
        
        guard let hardwareModelData = try? Data(contentsOf: hardwareModelURL) else {
            fatalError("Failed to retrieve hardware model data.")
        }

        guard let hardwareModel = VZMacHardwareModel(dataRepresentation: hardwareModelData) else {
            fatalError("Failed to create hardware model.")
        }
        
        if !hardwareModel.isSupported {
            fatalError("The hardware model isn't supported on the current host")
        }
        
        macPlatform.hardwareModel = hardwareModel
        
        guard let machineIdentifierData = try? Data(contentsOf: machineIdentifierURL) else {
            fatalError("Failed to retrieve machine identifier data.")
        }
        
        guard let machineIdentifier = VZMacMachineIdentifier(dataRepresentation: machineIdentifierData) else {
            fatalError("Failed to create machine identifier.")
        }
        macPlatform.machineIdentifier = machineIdentifier
        
        return macPlatform
    }
#endif
}
