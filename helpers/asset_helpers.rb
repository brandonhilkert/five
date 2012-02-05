class Five
  module AssetHelpers
    def image_tag(name)
      "<img src='/images/#{name}' alt='#{name}' />"
    end
  end

  helpers AssetHelpers
end