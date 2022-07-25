//
//  Path.swift
//  macOSVirtualMachineApp
//
//  Created by Yang Ji-Ho on 2022/07/25.
//

import Foundation

let vmBundlePath = NSHomeDirectory() + "/VM.bundle/"
let diskImagePath = vmBundlePath + "Disk.img"
let auxiliaryStorageURL = URL(fileURLWithPath: vmBundlePath + "AuxiliaryStorage")
let machineIdentifierURL = URL(fileURLWithPath: vmBundlePath + "MachineIdentifier")
let hardwareModelURL = URL(fileURLWithPath: vmBundlePath + "HardwareModel")
let restoreImageURL = URL(fileURLWithPath: vmBundlePath + "RestoreImage.ipsw")
