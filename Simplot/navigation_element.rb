class NavigationPage
   include PageObject

   App.power_nap(App::MIN_SLEEP)

   nav(:app_launcher,{:class => ['appLauncher slds-context-bar__icon-action']})
   button(:fg_csr_title,{:title => 'FG CSR Service Console'})

   a(:fg_csr_service_console,{:class => ['tile inner-card'],:index => 2})
   a(:fg_sales_lightning,{:class => ['tile inner-card'],:index => 2})

   span(:fg_sales_title,{:title =>'FG Sales Lightning'})

   def link_tag(link_name)
      send("#{link_name}")
   end

   def link(link_name)
      send("#{link_name}_element")
   end

   def input_tag(text_field_name)
      send("#{text_field_name}_element").click
   end

   def button_tag(text_field_name)
      send("#{text_field_name}_element").set
   end

   def text_tag(name,ele)
      send("#{name}_element").set ele
   end

   def get_text(element)
      send("#{element}_element").text
   end

end