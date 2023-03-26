# frozen_string_literal: true

module NotesHelper
  def render_with_hashtags(hashbody)
    hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー亜-黑?？!！0-9０-９]+/) do |word|
      link_to word, "/note/hashtag/#{word.delete('#')}", data: { 'turbolinks' => false }
    end.html_safe
  end
end
