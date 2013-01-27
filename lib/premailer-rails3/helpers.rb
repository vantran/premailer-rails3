module PremailerRails
  module Helpers
    def inline_css(template)
      PremailerRails::Premailer.new("#{render template}").to_inline_css
    end
  end
end
