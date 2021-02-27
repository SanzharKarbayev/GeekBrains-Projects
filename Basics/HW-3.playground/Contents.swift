import UIKit

enum mark {
    case BMW, Mercedes, Porche, Audi, Toyota, Nissan, Hyundai
}

enum engineStatus {
    case turnedOn, turnedOff
}

enum windowStatus {
    case openedWindow, closedWindow
}

enum actions{
    case engine, window, trunk
}

struct SportCar {
    let mark: mark
    let year: Int
    let trunkVolume: Int
    var usedTrunkVolume: Int
    var engineStatus: engineStatus
    var windowStatus: windowStatus
    var action: actions?
    
    
    init(mark: mark, year: Int, trunkVolume: Int, usedTrunkVolume: Int, engineStatus: engineStatus, windowStatus: windowStatus, action: actions?) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.usedTrunkVolume = usedTrunkVolume
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
        self.action = action
    }
    
    mutating func Action(action: actions, volume: Int? = nil) -> String?{
        if action == .engine {
            self.action = .engine
            if self.engineStatus == .turnedOff {
                self.engineStatus = .turnedOn
            } else {
                self.engineStatus = .turnedOff
            }
        } else if action == .trunk {
            self.action = .trunk
            if volume != nil {
                if self.usedTrunkVolume + volume! <= self.trunkVolume && self.usedTrunkVolume + volume! >= 0{
                    self.usedTrunkVolume += volume!
                    return "Less"
                } else if self.usedTrunkVolume + volume! > self.trunkVolume {
                    return "Greater"
                } else if self.usedTrunkVolume + volume! < 0 {
                    usedTrunkVolume = 0
                    return "Empty"
                }
            }
        } else if action == .window {
            self.action = .window
            if self.windowStatus == .closedWindow {
                self.windowStatus = .openedWindow
            } else {
                self.windowStatus = .closedWindow
            }
        }
        return nil
    }
}

var bmw_m5 = SportCar(mark: .BMW, year: 2020, trunkVolume: 20, usedTrunkVolume: 0, engineStatus: .turnedOff, windowStatus: .closedWindow, action: nil)
print("bmw_m5\'s mark is \(bmw_m5.mark)\n")
print("bmw_m5\'s year is \(bmw_m5.year)\n")
print("bmw_m5\'s trunk volume is \(bmw_m5.trunkVolume)\n")
print("bmw_m5\'s used trunk volume is \(bmw_m5.usedTrunkVolume)\n")
print("bmw_m5\'s engine status is \(bmw_m5.engineStatus)\n")
print("bmw_m5\'s window status is \(bmw_m5.windowStatus)\n")
print("\n")

print("bmw_m5's engine status is: \(bmw_m5.engineStatus)\n")
bmw_m5.Action(action: .engine)
print("bmw_m5's engine status is: \(bmw_m5.engineStatus)\n")

print("bmw_m5's window status is: \(bmw_m5.windowStatus)\n")
bmw_m5.Action(action: .window)
print("bmw_m5's window status is: \(bmw_m5.windowStatus)\n")

print("bmw_m5's trunk volume is \(bmw_m5.trunkVolume)\n")
var answer = bmw_m5.Action(action: .trunk, volume: 20)
if answer == nil || answer == "Less" {
    print("bmw_m5's used trunk volume is \(bmw_m5.usedTrunkVolume) \nEmpty space in trunk is \(bmw_m5.trunkVolume - bmw_m5.usedTrunkVolume)\n")
} else if answer == "Greater" {
    print("There\'s no more space for this volume!\n")
} else if answer == "Empty" {
    print("Epmty trunk!\n")
}
answer = bmw_m5.Action(action: .trunk, volume: -10)
if answer == nil || answer == "Less" {
    print("bmw_m5's used trunk volume is \(bmw_m5.usedTrunkVolume) \nEmpty space in trunk is \(bmw_m5.trunkVolume - bmw_m5.usedTrunkVolume)\n")
} else if answer == "Greater" {
    print("There\'s no more space for this volume!\n")
} else if answer == "Empty" {
    print("Epmty trunk!\n")
}
answer = bmw_m5.Action(action: .trunk, volume: -15)
if answer == nil || answer == "Less" {
    print("bmw_m5's used trunk volume is \(bmw_m5.usedTrunkVolume) \nEmpty space in trunk is \(bmw_m5.trunkVolume - bmw_m5.usedTrunkVolume)\n")
} else if answer == "Greater" {
    print("There\'s no more space for this volume!\n")
} else if answer == "Empty" {
    print("Epmty trunk!\n")
}
