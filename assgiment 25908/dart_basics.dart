//<25908/2024>-<bob>-<mohammed>-dart-basics
// Student: Mohammed abdelmoniem hassan adam
// Reg no: 25908
const String regNo = '25908';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Dart OOP Assignment: Kigali Bus Card
// All parts in one file. Run with: dart run main.dart

// ---------------------------------------------------------------
// Part 1: BusCard
// ---------------------------------------------------------------
class BusCard {
  String _owner = '';
  int _balance = 0;

  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  int get balance {
    return _balance;
  }

  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

// ---------------------------------------------------------------
// Part 2: StudentCard
// ---------------------------------------------------------------
class StudentCard extends BusCard {
  int _discount = 0;

  StudentCard(String owner, int balance, int discount)
      : super(owner, balance) {
    _discount = discount;
  }

  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

// ---------------------------------------------------------------
// Part 3: using the classes
// ---------------------------------------------------------------
void part3() {
  print('===== PART 3 =====');
  // My numbers: D = 0, L = 0   <-- replace with YOUR numbers
  // Starting balance = 5000 RWF, Bus fare = 400 RWF, Discount = 20%

  BusCard card = BusCard('Ama', 5000); // use YOUR name and balance
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5
  card.owner = 'Your Full Name';
  card.showInfo();

  // TODO 6
  card.topUp(100); // refused
  card.topUp(2000);

  // TODO 7
  card.pay(400);
  card.pay(400);
  card.showInfo();

  // TODO 8
  StudentCard student = StudentCard('Your Full Name', 5000, 20);

  // TODO 9
  student.pay(400);
  student.showInfo();
}

// ---------------------------------------------------------------
// Part 4: Bug hunt (FIXED version)
// ---------------------------------------------------------------
class Phone {
  String _brand = ''; // Bug 1: fields need starting values
  int _battery = 0;

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  int get battery {
    return _battery;
  }

  // Bug 4: added setter accepting only 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // Bug 2: must call the parent constructor with super(...)
  SmartPhone(String brand, int battery, String system)
      : super(brand, battery) {
    _system = system;
  }

  // Bug 3: removed @override, because Phone has no restart() method
  void restart() {
    print('Restarting $_system');
  }
}

void part4() {
  print('===== PART 4 =====');
  Phone p = new Phone('Tecno', 50); // NOT a bug: "new" is optional in Dart
  p.battery = 100;
  print(p.battery); // Bug 5: battery is a getter, not a method: no ()
}

// ---------------------------------------------------------------
// Part 5: Predict the output
// ---------------------------------------------------------------
class Bag {
  int _items = 0;

  int get items {
    return _items;
  }

  set items(int value) {
    if (value >= 0) {
      _items = value;
    }
  }

  void add() {
    _items = _items + 1;
  }
}

class BigBag extends Bag {
  @override
  void add() {
    super.add();
    super.add();
  }
}

void part5() {
  print('===== PART 5 =====');
  Bag a = Bag();
  a.add();
  a.items = -5;
  print(a.items);

  BigBag b = BigBag();
  b.add();
  b.add();
  b.items = b.items + 1;
  print(b.items);
}

// ---------------------------------------------------------------
// One main() runs everything
// ---------------------------------------------------------------
void main() {
  part3();
  part4();
  part5();
}