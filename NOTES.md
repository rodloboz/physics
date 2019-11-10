## Keyword Lists

A basic list:

```
mars = [
  4,
  :rocky,
  5.0
]
```

A basic list with tuples:

```
mars = [
  {:position, 4},
  {:type, :rocky},
  {:ev, 5.0}
]
```

An atom is used as a label and allows to get the corresponding value:
`mars[:ev] # 5.0`

Keyword list:

```
mars = [
  position: 4,
  type: :rocky,
  ev: 5.0
]
```

A list of tuples with values as keyword lists:

```
planets = [
  {:mercury, [type: :rocky, ev: 4.3]},
  {:venus, [type: :rocky, ev: 10.4]},
  {:jupiter, [type: :gaseous, ev: 59.5]}
]
```

Here's the same construct with syntactic sugar:

```
planets = [
  {:mercury, type: :rocky, ev: 4.3},
  {:venus, type: :rocky, ev: 10.4},
  {:jupiter, type: :gaseous, ev: 59.5}
]
```

## Maps

A map is a keyword list with some enhancements and a different syntactic structure:

```
mars = %{
  position: 4,
  type: :rocky,
  ev: 5.0
}
```

The key of a map can be anything, it's not just limited to atoms.

However, if you use an atom, you can use dot notation to read a value: `mars.ev # 5.0`

If you use a string as key, you have to use the literal string: `map["ev"] # 5.0`

## Structs

Structs are named maps

```
mars = %Planet{
  name: :mars,
  type: :rocky
  ev: 5.0
}
```

You can have default values and a name that doesn't change.

## Lists

Given this list of atoms:

```
planets = [
  :mercury,
  :venus,
  :earth,
  :mars,
  :jupiter,
  :saturn,
  :uranus,
  :neptune
]
```

You can perform Enum functions on it:

```
Enum.at(planets, 3) # :mars
Enum.find(planets, &(&1 == :mars)) # :mars
Enum.filter(planets, &(&1 == :mars)) # [:mars]
```

With a list of (keyword) lists:

```
planets = [
  [name: :mercury, type: :rocky, ev: 4.3],
  [name: :venus, type: :rocky, ev: 10.4],
  [name: :jupiter, type: :gaseous, ev: 59.5]
]
```

You can use pattern matching to match an element:

```
Enum.find(planets, fn([name: name, type: _type, ev: _ev]) -> name == :jupiter end)
# [name: :jupiter, type: :gaseous, ev: 59.5]
```

With a list of maps:

```
planets = [
  %{name: "Mercury", type: :rocky, ev: 4.3},
  %{name: "Venus", type: :rocky, ev: 10.4},
  %{name: "Jupiter", type: :gaseous, ev: 59.5}
]
```

You can use the same find routine to get an element from the list:

```
Enum.find(planets, fn(map) -> map.name == "Jupiter" end)
# %{ev: 59.5, name: "Jupiter", type: :gaseous}
```

To add an item to the list:

```
List.insert_at(planets, -1, %{name: "Pluto", type: :rocky, ev: 1.1})
[
  %{ev: 4.3, name: "Mercury", type: :rocky},
  %{ev: 10.4, name: "Venus", type: :rocky},
  %{ev: 59.5, name: "Jupiter", type: :gaseous},
  %{ev: 1.1, name: "Pluto", type: :rocky}
]
```

Or you can use the shorthand to append at the end:

```
planets ++ %{name: "Pluto", type: :rocky, ev: 1.1}
```

Or the shorthand to append at the beginning:

```
[%{name: "Pluto", type: :rocky, ev: 1.1}] ++ planets
```

Getting the first element and the rest of the list:

```
[head | tail] = planets
head
%{ev: 4.3, name: :mercury, type: :rocky}
tail
[
  %{ev: 10.4, name: :venus, type: :rocky},
  %{ev: 59.5, name: :jupiter, type: :gaseous}
]
```

## Counting

Elixir doesn't have loops, but we can use pattern matching and function arity to achieve similar results.

This is called head/tail recursion:

```
planets = [
  %{name: "Mercury", type: :rocky, ev: 4.3},
  %{name: "Venus", type: :rocky, ev: 10.4},
  %{name: "Jupiter", type: :gaseous, ev: 59.5}
]

def count_planets(planets), do: count_planets(planets, 0)
def count_planets([head | tail], count), do: count_planets(tail, count + 1)
def count_planets([], count), do: count

count_planets(planets) # 3
```
