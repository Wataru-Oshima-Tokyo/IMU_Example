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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.startGyroUpdates()
        manager.startAccelerometerUpdates()
        
        manager.accelerometerUpdateInterval = 1
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let _accelData = self.manager.accelerometerData{
                let accel_x = _accelData.acceleration.x
                let accel_y = _accelData.acceleration.y
                let accel_z = _accelData.acceleration.z
                print(accel_x,accel_y,accel_z)
            }
            
            if let _gyroData = self.manager.gyroData{
                let gyro_x = _gyroData.rotationRate.x
                let gyro_y = _gyroData.rotationRate.y
                let gyro_z = _gyroData.rotationRate.z
                print(gyro_x,gyro_y, gyro_z)
            }
        }
    }


}

