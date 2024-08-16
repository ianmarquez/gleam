import gleam/int
import gleam/list

fn square_number(number: Int) -> Int {
  number * number
}

pub fn square_of_sum(n: Int) -> Int {
  list.range(1, n)
  |> int.sum()
  |> square_number
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(1, n)
  |> list.map(fn(x: Int) { square_number(x) })
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
