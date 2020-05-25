# Class to handle bug #
class AcmeV1::Client::CertificateRequest::ECKeyPatch < OpenSSL::PKey::EC
  alias private? private_key?
  alias public? public_key?
end
