# Flickr list
## Project Description 


Your challenge, should you choose to accept it, is to create, from scratch, an iPhone application that allows a user to search Flickr for images. Create a user interface with a search bar at the top and a list or grid below it to display thumbnail images. The user should be able to enter text into the search bar and see a list or grid of images whose tags match the search string. The search string can be a single word (such as “porcupine”) or comma-separated words (such as “forest, bird”). As the user changes the text in the search bar, update the list or grid of images.

Fetch the list of images using this API from Flickr:

https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=porcupine

You’ll replace “porcupine” in that URL with the search word(s) typed by the user.

## Table of Contents

In the structure files contains: 

2 Models, 
4 Views, 
ViewModel, 
3 Network files,
Tests contains FakeNetworkManager and ImagesListViewModelTests

# Framework
SwiftUI and a wee bit of Combine

# Architecture
This application uses MVVM and clean architecture.

# Testing
Unit Test cases for ImageListViewModel using FakeNetworkManager by faking Test data, 
which is read from dummy test json files.

# Accessbility
Added VoiceOver accessibility using (.accessibilityElement, .accessibilityAddTraits, .accessibilityLabel)
Along with DynamicType support

# Animation
Added animations for GridCell taps using .matchedGeometryEffect
Right now animation may appear too swiftly so it may not be that visible.
But additional adjustments can be made to the animation for desired results.

# Extra Credit
Added belove extra functionality:
• Support landscape orientation
• Dynamic text support
• VoiceOver support
• Add unit or UI tests
• Add a button in the detail view to share the image and metadata
• Animate the image transition from the list or grid view to the detail view


# Screenshots

|PhotoGridView|DetailsScreen|ShareView|
|---|---|---|
|![simulator_screenshot_CB5E4F61-6EDE-4A50-A3FD-760C475FD948](https://github.com/ddismuke4502/AetnaCVScode/assets/60981061/ff77fac4-f732-4eb0-b0cc-6f5ff10f03de)|![simulator_screenshot_CBFD566D-CEC1-4CB8-95D3-C4AF7FFEE0D2](https://github.com/ddismuke4502/AetnaCVScode/assets/60981061/dba93ad3-00cf-4c15-bcca-03b535425bfe) |![simulator_screenshot_F92D25F8-9E07-4592-8388-09D2A5DACFAF](https://github.com/ddismuke4502/AetnaCVScode/assets/60981061/98bf8732-823e-4bf9-b246-e01ed163e01e) | |

