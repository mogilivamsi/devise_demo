class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: { writing: :primary,  reading: :follower }
  # connects_to shards: {
  #     default: { writing: :primary, reading: :primary_replica },
  #     shard_one: { writing: :primary_shard_one, writing: :primary_shard_one_replica }
  # }
end
