// Please define the TreasureChest generic custom type
pub type TreasureChest(a) {
  TreasureChest(password: String, contents: a)
}

pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

// Please define the UnlockResult generic custom type

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case password == chest.password {
    True -> Unlocked(chest.contents)
    _ -> WrongPassword
  }
}
