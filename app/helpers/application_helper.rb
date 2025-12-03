module ApplicationHelper
  def render_markdown(text)
    # Configurações do Renderizador HTML
    renderer_options = {
      hard_wrap: true,
      filter_html: false
    }

    # Configurações do Parser de Markdown
    markdown_options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      tables: true
    }

    renderer = Redcarpet::Render::HTML.new(renderer_options)
    markdown = Redcarpet::Markdown.new(renderer, markdown_options)

    markdown.render(text).html_safe
  end
end
