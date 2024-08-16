import gleam/int
import gleam/string

fn divisible_by(
  tuple: #(Int, String),
  divisor: Int,
  text: String,
) -> #(Int, String) {
  let #(number, accumulator) = tuple
  case number % divisor {
    0 -> #(number, accumulator <> text)
    _ -> tuple
  }
}

fn divisible_by_3(tuple: #(Int, String)) -> #(Int, String) {
  divisible_by(tuple, 3, "Pling")
}

fn divisible_by_5(tuple: #(Int, String)) -> #(Int, String) {
  divisible_by(tuple, 5, "Plang")
}

fn divisible_by_7(tuple: #(Int, String)) -> #(Int, String) {
  divisible_by(tuple, 7, "Plong")
}

pub fn convert(number: Int) -> String {
  let #(number, result) =
    #(number, "")
    |> divisible_by_3
    |> divisible_by_5
    |> divisible_by_7

  case string.length(result) > 0 {
    True -> result
    _ -> int.to_string(number)
  }
}
