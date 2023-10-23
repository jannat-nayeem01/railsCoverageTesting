Feature: Projects
  Scenario: Get Course Info
  Anyone should be able to see the list of students working on a project
  
  
  Given There is a project
  Given the project has students
  When I visit the project page
  Then I should see the project in the list
  Then I should see a show link for the project
  When I show the project details
  Then I should see a list of students on the project