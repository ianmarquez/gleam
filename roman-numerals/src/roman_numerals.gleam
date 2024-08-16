import gleam/list
import gleam/result

const roman_numerals = [
  #(1000, "M"), #(900, "CM"), #(500, "D"), #(400, "CD"), #(100, "C"),
  #(90, "XC"), #(50, "L"), #(40, "XL"), #(10, "X"), #(9, "IX"), #(5, "V"),
  #(4, "IV"), #(1, "I"),
]

fn convert_numerals(number: Int, result: String) -> String {
  case number > 0 {
    True -> {
      let #(key, value) = {
        roman_numerals
        |> list.find(fn(x) { x.0 <= number })
        |> result.unwrap(#(1, "I"))
      }
      convert_numerals(number - key, result <> value)
    }
    False -> result
  }
}

pub fn convert(number: Int) -> String {
  convert_numerals(number, "")
}
