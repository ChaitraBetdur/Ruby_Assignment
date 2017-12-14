@@FG_CSR_home_feature

Feature:FG CSR Service Console and FG Sales lightning Feature

  @FG_CSR_home
  Scenario Outline: verify the user is able to navigate to the fg csr service console and fg sales lightning home page
    Given I am logged in as "<user_profile>" user
    And I click on app_launcher icon
    And I click on "<console_type>"
    Then I should see title as"<title>"

   Examples:
    |user_profile |console_type          |title|
    |fg_csr_user  |fg_csr_service_console|fg_csr_title|
    |fg_sales_user|fg_sales_lightning    |fg_sales_title|
