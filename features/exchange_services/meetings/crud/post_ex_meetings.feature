# Author: Daniel Cabero
@crud
Feature: CRUD, Post request  exchanges meeting

  Scenario: : Create a exchanges meeting
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "candace.flynn@server.lab"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """

    And I execute the request
    Then I expect a '200' status code
    And the response should be:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "candace.flynn@server.lab"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """