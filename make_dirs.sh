#!/usr/bin/env bash
[ -f modules/null ] || (
 mkdir -p modules/null
 touch modules/null/main.tf modules/null/variables.tf modules/null/outputs.tf
 touch modules/null/README.md
)
[ -f modules/pte ] || (
 mkdir -p modules/pet
 touch modules/pet/main.tf modules/pet/variables.tf modules/pet/outputs.tf
 touch modules/pet/README.md
)
[ -f main.tf ] || (
  touch main.tf outputs.tf variables.tf
)
[ -f README.md ] || (
  touch README.md
)

