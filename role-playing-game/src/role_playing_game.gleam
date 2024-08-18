import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    _ if player.health == 0 -> {
      Some(
        Player(
          ..player,
          health: 100,
          mana: {
            case player.level > 9 {
              True -> Some(100)
              False -> None
            }
          },
        ),
      )
    }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> {
      #(Player(..player, health: player.health - cost |> int.max(0)), 0)
    }
    Some(mana) -> {
      case mana {
        _ if mana < cost -> #(player, 0)
        _ -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
      }
    }
  }
}
