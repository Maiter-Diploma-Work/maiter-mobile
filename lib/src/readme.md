## Project structure

Since this project is independent it follows the structure provided only by me, it's creator, and could be changed at any moment

As a person responsible for development of this I will try my best to make this one intuitive as possible

As for now the source code structure follows this hierarchy:
 - lib/src/ — a folder that contains the app.dart where the Material App widget being bootstrapped. It also ought to have the main router file and, perhaps, some authentication
   - layouts/ — a folder to contain layouts for pages. Nothing more
   - models/ — a folder that contains all the non-widget classes
   - screens/ — a folder that contain specific features of the application that shows as a dedicated screens
     - <feature-name>.dart — the main widget, that is showed on the page 
     - <feature-name>.route.dart — the routing for the page
     - <feature-name>/shared — widgets that is used across the feature
     - <feature-name>/<nested-feature-name>/ — nested features can have the same structure as their parent structure
   - services/ — a folder to contain services to separate views from performing the business logic, and store management
   - shared/ — a folder to contain widgets that is used across the entire application
   - store/ — a folder to contain the:
     - actions/ — actions for redux pattern
     - reducers/ — reducers for redux pattern
     - selectors/ — selectors for redux pattern
     - effects/ — side effects for redux pattern (???)
   - tests/ — a folder that contain the tests for any widget in application

## Terminology

Although you can know the meaning of words I use, it is necessary to make sure that we speak the same language and I'd want to ensure that we understand these things the same way:
 - Model — A class that represent some data, carry no business logic, and should be represented by view
 - Service — A class that carry all the business logic for the app and exists only in one exemplar (Singleton)
 - Layout — A widget that define the shape of the page, such as the TitleBar, BottomBar, where the content is showed and in what manner
 - Profile and User — across the application these two words will have separate meaning:
   - Profile — the current user, who uses the app in the moment
   - User — any other user
 - Event — A real life meet that created by user and other users nearby can join

## Tests

Unit testing and Test-Driven-Development is cool, but very debatable topic. I will not waste time to test things that have no functionality
There is no real reason for me to make unit-tests for layouts, models, and pretty much any stateless view that simply shows something
But there is a lot sense to make these tests for services, and stateful views that changes over time (like the interest list, that can change according to search)