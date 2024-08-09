# Syntax 

## Hello World

```rust 

// Hello World

fn void main() {
  print!("Hello Rafiki")
}
  
```

## If statements

```rust 
fn void main() {
  mut life = 42;

  if (life == 42) {
    life = 69;
  } else {
    life = 420;
  }

  print!("Life is %d", life);
}
```

## Loops

```rust 
fn void main() {
  for(mut i = 1; i <= 12; i += 1) {
    print!("%d day of Christmass\n", i);
  }
}
```

## factorial

```rust 
fn void main() {
  let num = factorial(7);
  print!("%d", num);
}

fn s64 factorial(num: s64) {
  if (num == 0) return 0;
  if (num == 1) return 1;
  return num * factorial(num - 1);
}

```
