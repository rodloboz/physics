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
