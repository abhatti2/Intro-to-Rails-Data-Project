Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :https
    policy.font_src    :self, :https, :data
    policy.img_src     :self, :https, :data
    policy.object_src  :none
    policy.script_src  :self, :https, :unsafe_inline  # Allow inline scripts
    policy.style_src   :self, :https, :unsafe_inline  # Allow inline styles for Leaflet
  end

  # Enable nonces for inline scripts and styles if needed
  config.content_security_policy_nonce_generator = ->(request) { SecureRandom.base64(16) }
end
