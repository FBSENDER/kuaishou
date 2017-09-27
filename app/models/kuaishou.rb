class User < ApplicationRecord
  self.table_name = 'kuaishou_users'
end

class Photo < ApplicationRecord
  self.table_name = 'kuaishou_photos'
end

class PhotoCount < ApplicationRecord
  self.table_name = 'kuaishou_photo_counts'
end

class TargetUser < ApplicationRecord
  self.table_name = 'kuaishou_target_userids'
end
