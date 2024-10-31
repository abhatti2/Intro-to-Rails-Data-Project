Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :https
    policy.font_src    :self, :https, :data
    policy.img_src     :self, :https, :data
    policy.object_src  :none

    # Allow Leaflet map scripts and styles
    policy.script_src  :self, :https, :unsafe_inline, :unsafe_eval  # Enable inline scripts
    policy.style_src   :self, :https, :unsafe_inline  # Enable inline styles

    # Enable nonce generation for additional CSP protection
    config.content_security_policy_nonce_generator = ->(request) { SecureRandom.base64(16) }
    config.content_security_policy_nonce_directives = %w[script-src style-src]
  end

  # Report violations instead of enforcing to debug
  config.content_security_policy_report_only = true
end
