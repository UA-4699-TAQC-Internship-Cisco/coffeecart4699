---
type: "Test case"
name: "Reload main page with an items in the cart"
about: 
title: "[Test Case]: "
labels: ["UI"]
assignees: []
---

**Date Time**
06-02-2025 16:20

**Priority**
High

**Description**
This test case check that added items remain in the cart, 
and matching the same amount after use reload the main page

**Pre-requisites**
Steps to be fulfilled before test:
1. Move to https://coffee-cart.app/

**Test Cases**
|      S#     |    Action   |  Test Data  | Expected Result |
|:-----------:|:-----------:|:-----------:|:---------------:|
|    1     |    Click on Espresso cup on main page   |   Item-Espresso, Unit-1, Total-10$     |      Espresso added to the cart, matching test data     |
|    2     |    Click on Mocha cup on main page   |    Item-Mocha, Unit-1, Total-8$    |      Espresso displayed, Mocha added to the cart       |
|    3     |    Click on Flat White cup on main page |    Item Flat White, Unit-1, Total-18$     |      Espresso, Mocha displayed, Flat White added to the cart, extra cup of Mocha menu displayed on the main page |
|    4     |    Reload the main page  |    Item-Espresso, Unit-1, Total-10$, Item-Mocha, Unit-1, Total-8$,  Item Flat White, Unit-1, Total-18$    |      Item-Espresso, Unit-1, Total-10$, Item-Mocha, Unit-1, Total-8$,  Item Flat White, Unit-1, Total-18$ are present in the cart      |




**Screenshots**
If applicable, add screenshots to help explain your test.

**Environment:**
 - OS: Windows
 - Browser Google Chrome 
 - Version 136.0.7103.116 (Official Build) (64-bit)

**Additional context**
Add any other context about the test here.  
 
 User story links E.g.: "User story #100 "
