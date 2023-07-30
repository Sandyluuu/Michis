class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions #or comments doesn't matter
  
  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta",
  "not_interested" => "No me interesa", "neutral" => "Neutral"}.freeze
  KindsMoji = {"like" => "😄", "dislike" => "☹️",
  "not_interested" => "🥱", "neutral" => "🤔"}.freeze

end
