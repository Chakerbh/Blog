module ApplicationHelper


  # http://allfuzzy.tumblr.com/post/27314404412/markdown-and-code-syntax-highlighting-in-ruby-on
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => false, 
                                  :hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true

    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
  module ControllerHelpers
    extend ActiveSupport::Concern

    included do
      include Devise::Test::ControllerHelpers
    end
  end
end
