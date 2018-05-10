class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.diff_notice.subject
  #
  def diff_notice(user, site)
    @site = site
    mail to: user.email
  end
end
