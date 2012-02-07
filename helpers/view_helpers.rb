#  ie. partial('timeline', locals: {tweets: @tweets})

class Five
  module ViewHelpers
    def partial(name, options={})
      haml("_#{name.to_s}".to_sym, options.merge(:layout => false))
    end
  end

  helpers ViewHelpers
end