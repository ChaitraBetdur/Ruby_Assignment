Feature:View the file related list in the Opportunity records

  Scenario Outline: ability to view the File related list in the Opportunity records

    Given I am on the "<application>" Application as a "<fg_user>"
    And I am on the Opportunities homepage
    When I go to one of the available opportunities
    And I go to the Related List
    Then The File related list should be displayed

  Examples:

  |application|fg_user|
  |fg_sales_lightning|fg_sales_user|
  |fg_csr_service_console|fg_csr_user|