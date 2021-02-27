import Cocoa

enum Action {
    case engineOn, engineOff, windowOn, windowOff
}
enum DriveMode {
    case comfortMode, sportMode
}

protocol Car: AnyObject {
    var engineStatus: Action { get set }
    var windowStatus: Action { get set }
    func engine()
    func window()
}

extension Car {
    func engine () {
        if engineStatus == .engineOff{
            engineStatus = .engineOn
        } else {
            engineStatus = .engineOff
        }
    }
    func window() {
        if windowStatus == .windowOff{
            windowStatus = .windowOn
        } else {
            windowStatus = .windowOff
        }
    }
}

class SportCar: Car {
    let horsePower: Int
    let torque: Int
    var driveMode: DriveMode
    var engineStatus: Action
    var windowStatus: Action
    init(horsePower: Int, torque: Int) {
        self.horsePower = horsePower
        self.torque = torque
        self.driveMode = .comfortMode
        self.engineStatus = .engineOff
        self.windowStatus = .windowOff
    }
    func changeDriveMode() {
        if self.driveMode == .comfortMode {
            self.driveMode = .sportMode
        } else if self.driveMode == .sportMode {
            self.driveMode = .comfortMode
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
                horse power: \(self.horsePower)
                torque: \(self.torque)
                drive mode: \(self.driveMode)
                engine status: \(self.engineStatus)
                window status: \(self.windowStatus)

                """
    }
    
}

var bmw_m5 = SportCar(horsePower: 500, torque: 700)
print(bmw_m5)

bmw_m5.engine()
bmw_m5.window()
bmw_m5.changeDriveMode()
print(bmw_m5)
