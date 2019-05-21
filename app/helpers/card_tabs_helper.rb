module CardTabsHelper
  def current_card_tab_or_not(target_id)
    current_card_tab?(target_id) ? "is-active" : ""
  end

  private
    def current_card_tab?(target_id)
      paths = url_for.split("/")
      if paths[-2] == "works" && paths.last == target_id
        true
      elsif paths[-2] == "stages" && paths.last == target_id
        true
      end
    end
end
