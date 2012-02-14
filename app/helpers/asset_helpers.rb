class Five
  module AssetHelpers
    def image_tag(name)
      if name.include?("http://") or name.include?("https://")
        "<img src='#{name}' alt='#{name}' />"
      else
        "<img src='/images/#{name}' alt='#{name}' />"
      end
    end
  end

  helpers AssetHelpers
end