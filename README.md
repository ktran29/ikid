# iKid

## Assignment
This app is a simple tabbed app that has three categories of jokes: a good joke, a pun, and a dad joke (although they're all pretty bad jokes).

## Design
Each category goes to a simple page that has a label containing a question/punchline and a button to go between the two. Even though each page is flipping, and the first one flips multiple times, there's only one ViewController for each category. On each flip, the text is being replaced and the direction of the flip depends on the part of the joke. Instead of having two ViewControllers for each category, this cleans up both the storyboard and the Swift code.
