module CardTabsHelper
  def current_card_tab_or_not(target_id)
    current_card_tab?(target_id) ? "is-active" : ""
  end

  private
    def current_card_tab?(target_id)
      paths = url_for.split("/")
      if paths.last == target_id
        true
      end
    end
end
