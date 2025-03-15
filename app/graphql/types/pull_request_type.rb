class Types::PullRequestType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :url, String, null: false
  field :state, String, null: false
  field :mergedBy, Types::MergedByType, null: true
  field :createdAt, String, null: true
  field :number, Integer, null: false
  field :changedFiles, Integer, null: true
  field :additions, Integer, null: false
  field :deletions, Integer, null: false
  field :baseRepository, Types::RepositoryType, null: true
  field :pageInfo, Types::PageInfoType, null: false
end

# 
