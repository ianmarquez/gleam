import gleam/list
import gleam/result

fn get_multiples(factor: List(Int), limit: Int) -> List(Int) {
  let first = list.last(factor) |> result.unwrap(0)
  let last = list.first(factor) |> result.unwrap(0)
  case first > limit {
    True -> [0]
    False -> {
      case factor {
        [_, ..] if last + first >= limit || last == 0 -> factor
        [first] -> get_multiples([first + first, first], limit)
        _ -> get_multiples([first + last, ..factor], limit)
      }
    }
  }
}

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.map(factors, with: fn(value) { get_multiples([value], limit) })
  |> list.flatten
  |> list.unique
  |> list.reduce(with: fn(value, accumulated_value) {
    value + accumulated_value
  })
  |> result.unwrap(0)
}
