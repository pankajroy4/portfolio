module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    # def current_agency
    #   context[:current_agency]
    # end

    # def current_user
    #   context[:current_user]
    # end

    # def find_agency_from_key(application_key)
    #   app = find_white_label_app(application_key)

    #   return nil if app.blank?

    #   app.agency
    # end

    # def find_white_label_app(application_key)
    #   ::WhiteLabel::App.find_by_key application_key
    # end
  end
end
