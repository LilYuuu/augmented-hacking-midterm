# Spatial Note
## Augmented Hacking, Fall 2023

### Nov 1
* Switched from raycasting to simple plane placement using:
  ```
  let planeAnchor = AnchorEntity(.plane([.vertical, .horizontal], 
                                        classification: [.wall, .floor, .ceiling],
                                        minimumBounds: [1.0, 1.0]))
  ```
* Got rid of the tapping gesture
* Updated the UI for MessageView
#### TO-DO:
* Use plane classification to: (Link to [example code](https://github.com/augmentedhacking/ar-plane-classification))
  * update placement position
  * place messages by specified plane category
  
---

### Oct 26
* Used raycasting for entity placement (Link to [tutorial](https://coledennis.medium.com/tutorial-tap-to-place-ar-content-using-realitykit-and-swiftui-e2579d93708d
))
* Added tapping as a trigger for placement
