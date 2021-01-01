class Contact < MailForm::Base
  include MailForm::Delivery

  attribute :name, :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Contact Form",
      :to => "test.site.hubert@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
