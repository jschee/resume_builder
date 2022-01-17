module Groverable
  extend ActiveSupport::Concern

  def render_pdf(controller, template, ins_var)
    set_base_url
    invoice = controller.render(
      template: template,
      layout: 'pdf',
      locals: set_ins_var(ins_var)
    )
    html_absolute = Grover::HTMLPreprocessor.process invoice, @base_url, "http"
    pdf = Grover.new(html_absolute, { display_url: @base_url }).to_pdf
    send_data pdf, type: 'application/pdf; charset=binary', filename: "#{@resume.author.first_name.downcase}_#{@resume.author.last_name.downcase}_resume.pdf"
  end

  private

  def set_base_url
    if Rails.env.development?
      @base_url = "http://localhost:3000/"
    end
  end

  def set_ins_var(obj)
    case obj
    when @resume
      { :@resume => @resume }
    else
      p "no object was passed"
    end
  end
end