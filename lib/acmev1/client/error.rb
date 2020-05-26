class AcmeV1::Client::Error < StandardError
  class NotFound < AcmeV1::Client::Error; end
  class BadCSR < AcmeV1::Client::Error; end
  class BadNonce < AcmeV1::Client::Error; end
  class Connection < AcmeV1::Client::Error; end
  class Dnssec < AcmeV1::Client::Error; end
  class Malformed < AcmeV1::Client::Error; end
  class ServerInternal < AcmeV1::Client::Error; end
  class AcmeV1::Tls < AcmeV1::Client::Error; end
  class Unauthorized < AcmeV1::Client::Error; end
  class UnknownHost < AcmeV1::Client::Error; end
  class Timeout < AcmeV1::Client::Error; end
  class RateLimited < AcmeV1::Client::Error; end
  class RejectedIdentifier < AcmeV1::Client::Error; end
  class UnsupportedIdentifier < AcmeV1::Client::Error; end
end
