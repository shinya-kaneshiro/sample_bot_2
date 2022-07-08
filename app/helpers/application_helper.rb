module ApplicationHelper
  require "uri"

  def full_title(page_name = "")
      base_title = "AgainstFc"
      if page_name.empty?
        base_title
      else
        page_name + " | " + base_title
      end
  end

  # テキスト内のURL文字列をリンク化する。
  def text_url_to_link(text)
    URI.extract(text, ['http','https'] ).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
  
      text.gsub!(url, sub_text)
    end
    return text
  end


end
