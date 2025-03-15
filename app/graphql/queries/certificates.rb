class Queries::Certificates < Queries::BaseQuery
  type [Types::CertificateType], null: false

  def resolve
    Certificate.order(:position)
  end
end
