module NotesHelper
  def render_with_hashtags(hashbody)
    hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー亜-黑?？!！0-9０-９]+/){|word| link_to word, "/note/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end 
end
