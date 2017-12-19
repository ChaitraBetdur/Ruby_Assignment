class Opportunities_testPage
  include PageObject
  span(:opportunities,{:class => "label slds-truncate slds-text-link"})

  a(:link_to_view_Automation_test_Opportunities,{:class => "triggerLink slds-button slds-button--reset slds-type-focus slds-truncate forceListViewPicker"})
  #span(:automation_test_opportunities,{:class => "virtualAutocompleteOptionText", :index => 4})
  span(:automation_test_opportunities,{:text => "Automation Test Opportunities"})
  a(:select_record,{:class => "slds-truncate outputLookupLink slds-truncate forceOutputLookup", :index => 0})
  a(:related,{:title => "Related"})
  a(:no_of_files,{:class => "slds-card__header-link baseCard__header-title-container", :index =>2})

  text_field(:search_module,{:class => "slds-input input"})
  button(:close_tab,{:class => "slds-button slds-button--icon-x-small slds-button--icon-container" , :index => 2})

  def link_tag(link_name)
    send("#{link_name}")
    puts "Clicked on #{link_name}"
  end

  def input_tag(text_field_name)
    send("#{text_field_name}_element").click
  end

  def get_text(element)
    send("#{element}_element").text
  end

  def text_tag(name,ele)
    send("#{name}_element").set ele
  end

end