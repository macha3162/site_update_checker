module ApplicationHelper

  def diff_str(text)
    # text.gsub(/[\r\n|\t|\r|\n]+/, "\n")
    Sanitize.clean(text, remove_contents: ['script', 'style']).gsub(/[\r\n|\t|\r|\n]+/, "\n")
  end
end
