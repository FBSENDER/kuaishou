class MUser < ApplicationRecord
  self.table_name = 'meipai_users'
end

class MPhoto < ApplicationRecord
  self.table_name = 'meipai_photos'
end

class MPhotoCount < ApplicationRecord
  self.table_name = 'meipai_photo_counts'
end

class MTargetUser < ApplicationRecord
  self.table_name = 'meipai_target_userids'
end
