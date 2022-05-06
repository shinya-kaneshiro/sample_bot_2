module ApplicationHelper

    def full_title(page_name = "")
        # base_title = "Sample"
        base_title = "AgainstFc"
        if page_name.empty?
          base_title
        else
          page_name + " | " + base_title
        end
      end
    
end
