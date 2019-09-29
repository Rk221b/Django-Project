# Django-Project

The application should contain 2 types of users: Coordinator and Students
3. Pages to be developed-
● ‘Registration’ pages - Different registration pages for Coordinators & students.
Capture student’s stream during registration.
● ‘Login’ pages - Single/different login pages for coordinators & students.
● ‘Add event info’ page - A coordinator, once logged in, should be able to add
details of new events of their college. Access to this page should be restricted
only to coordinators.
● ‘Available events’ page - There should be a page that displays all the available
events along with which college host them and a ‘Join Event’ button. This page
should be accessible to everyone, irrespective of whether the user is logged in or
not. Expected functionality on click of the 'Join Event' button-
○ Only students should be able to join events by clicking the ‘Join Event’
button.
○ If the user is not logged in, then he/she should be redirected to the login
page.
○ If a user is logged in as a coordinator, then the user should not be allowed
to join for an event.

● ‘View participants’ page - Coordinator should be able to see the list of all the
students who have joined for particular event from his/her college.
