# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/diff_notice
  def diff_notice
    UserMailer.diff_notice(User.first, Site.first)
  end

end
