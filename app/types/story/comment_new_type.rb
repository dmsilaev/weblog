class Story::CommentNewType < Story::Comment
  include ApplicationType

  permit :body, :parent_id
end