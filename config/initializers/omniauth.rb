Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
    Rails.application.secrets.github_omniauth_provider_key,
    Rails.application.secrets.github_omniauth_provider_secret,
    scope: "user,repo,admin:repo_hook"
end
