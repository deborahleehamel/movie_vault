module ApplicationHelper

  def check_watched_status(status)
    if status == true
      "Watched"
    else
      "Unwatched"
    end
  end

  def watched_button_text(status)
    if status == true
      "Mark as Unwatched"
    else
      "Mark as Watched"
    end
  end

end
