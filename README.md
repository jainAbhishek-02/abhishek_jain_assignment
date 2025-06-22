# abhishek_jain_assignment

Task assignment submission by:<br />
Abhishek Jain<br />
8284822840

# 🧱 C Shape Boxes - Flutter App

This Flutter application allows users to input a number (`N` between 5 and 25), which dynamically creates `N` square colored boxes arranged in the shape of the letter **'C'**. Users can interact with these boxes by tapping to toggle their color from red to green. Once all boxes are green, they automatically revert back to red in the reverse order of interaction using a timed animation.

---

## 🚀 Features

- Dynamic rendering of boxes based on user input (5–25)
- Boxes arranged in a visually accurate "C" shape
- Tap to toggle boxes red ⟶ green
- Automatically reverts back with animation once all boxes are green
- Fully responsive layout with both horizontal and vertical scrolling

---
## 🧠 Logic
#### Input & Box Generation
- Users enter a number N via a TextField.
- On submission, N boxes are generated, all initially red.

#### C Shape Layout
##### Boxes are split into:
- Top Row: ~1/3 of N
- Vertical Column (left-aligned): ~1/3 of N
- Bottom Row: Remaining ~1/3
- Layout is built using Row and Column widgets inside a scrollable view (SingleChildScrollView).

#### Tap Interaction
- Tapping a box toggles it from red ➝ green.
- Tap order is tracked in a List<int> to remember sequence.

#### Reverse Animation
- Once all boxes are green:
- A 1-second delay loop turns them back red in reverse order of taps.
- After reset, user can interact again.

#### Optimization
- Using const wherever required
- Stateless widgets (ColorBox, CShapeBuilder) reduce unnecessary rebuilds.
- Defensive programming avoids index overflows.
- TextEditingController disposed to avoid memory leaks.


---

## 🔧 Setup Instructions

Flutter (Channel stable, 3.29.3), Dart version 3.7.2

1. **Clone the repo**
2. **Run commands:**
    ```
    flutter clean && flutter pub get
3. **Run the app**