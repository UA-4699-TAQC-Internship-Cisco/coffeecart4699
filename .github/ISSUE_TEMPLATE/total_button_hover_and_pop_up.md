---
type: "Test case"
name: "Hover on Total button, edit pop up menu"
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
This test case check that user is able to add, edit, and delete an item on Total button

**Pre-requisites**
Steps to be fulfilled before test:
1. Move to https://coffee-cart.app/
2. Add Espresso to the cart

**Test Cases**
|      S#     |    Action   |  Test Data  | Expected Result |
|:-----------:|:-----------:|:-----------:|:---------------:|
|    1     |    Hover on Total button on the main page   |   Item-Espresso, Unit-1, Total-10$     |      Espresso added to the cart, matching test data     |
|    2     |    Click 3 times on plus "+" icon on the Espresso on the pop up menu  |    Item-Espresso, Unit-1, Total-10$     |      An extra Espresso added to the cart, matching test data * 4      |
|    3     |    Click 1 times on minus "-" icon on the Flat White in the cart     |    Item-Espresso, Unit-1, Total-10$     |      All items are deleted from the cart, Total button displayed 0.00       |




**Screenshots**
If applicable, add screenshots to help explain your test.

**Environment:**
 - OS: Windows
 - Browser Google Chrome 
 - Version 136.0.7103.116 (Official Build) (64-bit)

**Additional context**
Add any other context about the test here.  
 
 User story links E.g.: "User story #100 "
