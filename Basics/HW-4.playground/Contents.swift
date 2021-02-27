import Cocoa

enum Mark {
    case BMW, Mercedes, Porche, Audi, Toyota, Nissan, Hyundai
}

enum Color {
    case white, black, red, blue, green, orange
}

enum Trunk {
    case less, greater, empty
}

enum Transmission {
    case manual, auto
}

enum Action {
    case comfortMode, sportMode, trunk
}

class Car {
    let mark: Mark
    let year: Int
    let color: Color
    var transmission: Transmission?
    var action: Action?
    
    
    init(mark: Mark, year: Int, color: Color, transmission: Transmission?) {
        self.mark = mark
        self.year = year
        self.color = color
        self.transmission = transmission
    }
    
    func action(action: Action) {}
}

class SportCar: Car {
    let horsePower: Int
    let torque: Int
    var driveMode: Action?
    
    init(mark: Mark, year: Int, color: Color, horsePower: Int, torque: Int) {
        self.horsePower = horsePower
        self.torque = torque
        self.driveMode = .comfortMode
        super.init(mark: mark, year: year, color: color, transmission: .auto)
        self.action = .comfortMode
    }
    
    override func action(action: Action) {
        self.action = action
        if action == .comfortMode {
            self.driveMode = action
            self.transmission = .auto
        } else if action == .sportMode{
            self.driveMode = action
            self.transmission = .manual
        }
    }
}

class TruckCar: Car {
    let trunkVolume: Int
    var usedTrunkVolume: Int
    var trunkStatus: Trunk?
    
    
    init(mark: Mark, year: Int, color: Color, trunkVolume: Int, usedTrunkVolume: Int) {
        self.trunkVolume = trunkVolume
        self.usedTrunkVolume = usedTrunkVolume
        super.init(mark: mark, year: year, color: color, transmission: .auto)
    }
    
     func action(action: Action, volume: Int?){
        //в данном случае мы не override-им метод action? пытался выполнить с override но выдавало ошибку что мы не переписываем никакой метод. то есть с добавлением элементов создается новый метод? и он никак не связан с action(action: Action), даже не смотря что имена у них одинаковые?
        if action == .trunk {
            self.action = .trunk
            if volume != nil {
                if self.usedTrunkVolume + volume! <= self.trunkVolume && self.usedTrunkVolume + volume! >= 0{
                    self.usedTrunkVolume += volume!
                    self.trunkStatus = .less
                } else if self.usedTrunkVolume + volume! > self.trunkVolume {
                    self.trunkStatus = .greater
                } else if self.usedTrunkVolume + volume! < 0 {
                    usedTrunkVolume = 0
                    self.trunkStatus = .empty
                }
            }
        }
        if self.trunkStatus! == .less {
            print("Trunk has \(self.trunkVolume - self.usedTrunkVolume) empty space!")
        } else if self.trunkStatus! == .greater {
            print("There is not so much space in the trunk!")
        } else if self.trunkStatus! == .empty {
            print("Trunk is empty!")
        }
    }
}

let bmw_m8 = SportCar(mark: .BMW, year: 2020, color: .blue, horsePower: 600, torque: 800)

print(bmw_m8.driveMode!,
      bmw_m8.horsePower,
      bmw_m8.torque,
      bmw_m8.action!,
      bmw_m8.color,
      bmw_m8.mark,
      bmw_m8.transmission!,
      bmw_m8.year)

bmw_m8.action(action: .comfortMode)
print(bmw_m8.driveMode!, bmw_m8.action!, bmw_m8.transmission!)


bmw_m8.action(action: .sportMode)
print(bmw_m8.driveMode!, bmw_m8.action!, bmw_m8.transmission!)


let truckMercedes = TruckCar(mark: .Mercedes, year: 2017, color: .white, trunkVolume: 100, usedTrunkVolume: 30)

print(truckMercedes.trunkVolume,
      truckMercedes.usedTrunkVolume,
      truckMercedes.action,
      truckMercedes.color,
      truckMercedes.mark,
      truckMercedes.transmission!,
      truckMercedes.year)

truckMercedes.action(action: .trunk, volume: 50)

truckMercedes.action(action: .trunk, volume: 50)

truckMercedes.action(action: .trunk, volume: -100)


print(truckMercedes.trunkVolume,
      truckMercedes.usedTrunkVolume,
      truckMercedes.action!,
      truckMercedes.color,
      truckMercedes.mark,
      truckMercedes.transmission!,
      truckMercedes.year,
      truckMercedes.trunkStatus!)
