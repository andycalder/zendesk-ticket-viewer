# Zendesk ticket viewer

A command line app for viewing Zendesk support tickets.

## Installation

The app requires Ruby 2.6.6 or later. To try it out run:
```
git clone https://github.com/andycalder/zendesk-ticket-viewer.git
cd zendesk-ticket-viewer
ruby app.rb
```

Unit tests require `rspec`. To install `rspec` run:
```
bundle install
```

To run unit tests for a model run:
```
ruby spec/{file}.rb
```

## Usage

You will be prompted to sign in with your Zendesk subdomain, email and password. Once you are authenticated you will be presented with a list view showing ticket details. Navigation options are as follows:
* Enter 1, then ticket id, to view ticket details
* Enter 2 to view the previous page
* Enter 3 to view the next page
* Enter 4 to quit the application

## Design decisions

The app follows the model-view-controller (MVC) design pattern.
* Model classes store core data such as `Ticket`, `Page` and `Session`.
* View classes display data to the user and retrieve user input.
* Controller classes route user input to interact with the data.

The app uses the Zendesk [tickets API](https://developer.zendesk.com/rest_api/docs/support/tickets) to fetch ticket data. [Cursor pagination](https://developer.zendesk.com/rest_api/docs/support/introduction#using-cursor-pagination) is used to limit the list view to 25 tickets per page.



