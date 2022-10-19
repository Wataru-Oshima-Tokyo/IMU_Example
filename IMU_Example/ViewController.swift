//
//  ViewController.swift
//  IMU_Example
//
//  Created by Wataru Oshima on 10/16/22.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    
    let manager = CMMotionManager()
    
    @IBOutlet weak var pitch_label: UILabel!
    @IBOutlet weak var roll_label: UILabel!
    @IBOutlet weak var yaw_label: UILabel!
    @IBOutlet weak var initialize_buttonLabel: UIButton!
    
    var pitch:Float = 0.0
    var roll:Float = 0.0
    var yaw:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize_buttonLabel.setTitle("Initialize", for: .normal)
        manager.startGyroUpdates()
        manager.startAccelerometerUpdates()
        
        manager.accelerometerUpdateInterval = 1

        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            if let _accelData = self.manager.accelerometerData{
                let accel_x = _accelData.acceleration.x
                let accel_y = _accelData.acceleration.y
                let accel_z = _accelData.acceleration.z
                print(accel_x,accel_y,accel_z)
            }
            
            if let _gyroData = self.manager.gyroData{
                //rotation values are measured in radians per second around the given axis
                let gyro_x = _gyroData.rotationRate.x
                let gyro_y = _gyroData.rotationRate.y
                let gyro_z = _gyroData.rotationRate.z
                self.pitch = self.pitch + Float(gyro_x*180/3.14)/1000
                self.roll = self.roll + Float(gyro_z*180/3.14)/1000
                self.yaw = self.yaw + Float(gyro_y*180/3.14)/1000
                self.pitch_label.text = "pitch: \(self.pitch)"
                self.roll_label.text = "roll: \(self.roll)"
                self.yaw_label.text = "yaw: \(self.yaw)"
            }
        }
    }
    

    @IBAction func initialize_button(_ sender: UIButton) {
        
        self.pitch = 0.0
        self.roll = 0.0
        self.yaw = 0.0
    }
    
    
}

