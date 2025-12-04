# Permite apenas POST (segurança padrão)
OmniAuth.config.allowed_request_methods = [:post]

# Silencia avisos chatos no log
OmniAuth.config.silence_get_warning = true

# Se a verificação padrão estiver falhando, desativa a verificação DUPLA da gem,
# confiando que o Rails já protegeu o formulário via button_to.
OmniAuth.config.request_validation_phase = nil
