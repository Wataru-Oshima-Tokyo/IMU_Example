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
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.startGyroUpdates()
        manager.startAccelerometerUpdates()
        
        manager.accelerometerUpdateInterval = 1
        var pitch:Float = 0.0
        var roll:Float = 0.0
        var yaw:Float = 0.0
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
                pitch = pitch + Float(gyro_x*180/3.14)/1000
                roll = roll + Float(gyro_z*180/3.14)/1000
                yaw = yaw + Float(gyro_y*180/3.14)/1000
                self.pitch_label.text = "pitch: \(pitch)"
                self.roll_label.text = "roll: \(roll)"
                self.yaw_label.text = "yaw: \(yaw)"
            }
        }
    }


}

